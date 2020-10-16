package tpmbds

import grails.converters.JSON
import grails.converters.XML
import groovy.json.JsonBuilder

class ApiController {

    // Gestion API REST DU SITE LECOINCOIN

/*
méthodes GET / PUT  / DELETE
 */

/******* RESSOURCE INDIVIDUEL USER *******/
    def user() {
        switch (request.getMethod()) {
            case "GET":
                // Vérification de la requête sur l'URL
                if (!params.id)
                    return response.status = 400
                // stockage des nouveaux paramètre de la requête dans userInstance
                def userInstance = User.get(params.id)
                //Vérification de la correspondance de l'ID de la requête avec la base de donnée
                if (!userInstance)
                    return response.status = 404
                //gstion de l'affichage des données sur un Json
                def builder = new JsonBuilder()
                builder.user{
                    id userInstance.id
                    username userInstance.username
                    saleAds userInstance.saleAds.collect {
                        [
                                id      : it.getId(),
                                title : it.getTitle(),
                                description: it.getDescription()
                        ]
                    }
                }
                render builder.toPrettyString()
                break

            case "PATCH":
                if (!params.id || !request.JSON.username || !request.JSON.password)
                    return response.status = 400

                def userInstance = User.get(params.id) //si l'id n'est attaché à aucun user existant
                if (!userInstance)
                    return response.status = 404
                def map = [username: request.JSON.username, password: request.JSON.password]
                userInstance.properties = map
                userInstance.save (flush: true)
                return response.status = 204
                break

            case "DELETE":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                UserRole.removeAll(userInstance)
                userInstance.delete(flush: true)
                return response.status = 204
                break
            default:
                return response.status = 405
                break
        }
        return response.status = 406
    }

/******* RESSOURCE INDIVIDUEL SALEAD *******/
    def saleAd() {

         switch (request.getMethod()) {
             case "GET":
                 if (!params.id)
                     return response.status = 400
                 def saleAdInstance = SaleAd.get(params.id)
                 if (!saleAdInstance)
                     return response.status = 404
                 response.withFormat {
                     xml { render saleAdInstance as XML }
                     json { render saleAdInstance as JSON }
                 }
                break

            case "PATCH":
                if (!params.id || !request.JSON.title || !request.JSON.price || !request.JSON.description
                        || !request.JSON.longDescription)
                    return response.status = 400
                def saleAdInstance = SaleAd.get(params.id) //si l'id est attaché à une instance
                if (!saleAdInstance)
                    return response.status = 404

                def map = [title: request.JSON.title, price: request.JSON.price, description: request.JSON.description,
                           longDescription: request.JSON.longDescription]
                // we then bind data to the model object this way
                saleAdInstance.properties = map
                // and save the updated user
                saleAdInstance.save (flush: true)
                return response.status = 204
                break

             case "DELETE":
                 if(!params.id) {
                     return response.status = 400
                 }
                 def saleAdInstance = SaleAd.get(params.id) //si l'id est attaché à une instance
                 if (!saleAdInstance) {
                     return response.status = 404
                 }

                 saleAdInstance.delete(flush: true)
                 return response.status = 204
                 break
             default:
                 return response.status = 405
                 break

        }
        return response.status = 406
    }


    /*
    méthode GET et POST
     */

/******* COLLECTION USERS *******/
    def users(){
        switch (request.getMethod()) {
            case "GET":
                def userList = User.list()
                def builder = new JsonBuilder()
                builder {
                    users userList.collect {
                        [
                                id      : it.getId(),
                                username: it.getUsername(),
                        ]
                    }
                }
                render builder.toPrettyString()
                break

            case "POST":
                if (!request.JSON.username || !request.JSON.password || !request.JSON.roleId)
                    return response.status = 400
                // On vérifie si le nom existe déjà dans la base
                if(User.findByUsername((request.JSON.username)) != null){
                    response.status = 400
                    response.withFormat {
                        xml { render ([error: 'Username already exists'] as XML)}
                        json { render ([error: 'Username already exists'] as JSON)}
                    }
                    return
                }
                // On vérifie si le role id existe
                if(request.JSON.roleId != 1 && request.JSON.roleId != 2 && request.JSON.roleId != 3 ){
                    response.status = 400
                    response.withFormat {
                        xml { render ([error: 'Invalid role Id'] as XML)}
                        json { render ([error: 'Invalid role Id'] as JSON)}
                    }
                    return
                }
                def newUser = new User(username: request.JSON.username, password: request.JSON.password).save(flush: true)
                UserRole.create(newUser, Role.get(request.JSON.roleId), true)
                return response.status = 201
                break
            default:
                return response.status = 405
                break
        }
        return response.status = 406
    }
/******* COLLECTION SALEADS *******/
    def saleAds(){
        switch (request.getMethod()) {
            case "GET":
                def ListSaleAd= SaleAd.list()
                response.withFormat {
                    xml { render ListSaleAd as XML }
                    json { render ListSaleAd as JSON }
                }
                break
            
            case "POST":
                if (!request.JSON.title
                        || !request.JSON.description
                        || !request.JSON.longDescription
                        || !request.JSON.price
                        || !request.JSON.authorId){

                    return response.status = 400
                }
                // On teste si le prix rentré est bien un nombre
                if(!(request.JSON.price instanceof Number)){
                    response.status = 400
                    response.withFormat {
                        xml { render ([error: 'Price is not a number'] as XML)}
                        json { render ([error: 'Price is not a number'] as JSON)}
                    }
                }
                def newSaleAd = new SaleAd(
                        title: request.JSON.title,
                        description: request.JSON.description,
                        longDescription: request.JSON.longDescription,
                        price: request.JSON.price
                )
                def userInstance = User.get(request.JSON.authorId)
                // On teste si l'auteur entré existe bien
                if (!userInstance){
                    response.status = 404
                    response.withFormat {
                        xml { render ([error: 'Author not found'] as XML)}
                        json { render ([error: 'Author not found'] as JSON)}
                        return
                    }
                }
                userInstance.addToSaleAds(newSaleAd)
                userInstance.save(flush: true, failOnError: true)
                return response.status = 201
                break

            default:
                return response.status = 405
                break
        }
        return response.status = 406
    }

}
