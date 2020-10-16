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

                def userInstance = User.get(params.id) //si l'id est attaché à une instance
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
                def userInstance = new User(username: params.username, password: params.password).save(flush: true)
                UserRole.create(userInstance, Role.get(params.role), flush: true)
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
                def saleAdInstance = new SaleAd(
                        title: params.title,
                        description: params.description,
                        longDescription: params.longDescription,
                        price: params.price)
                def userInstance = User.get(params.userId)
                userInstance.addToSaleAds(saleAdInstance)
                userInstance.save(flush: true, failOnError: true)
                break

            default:
                return response.status = 405
                break
        }
        return response.status = 406
    }

}
