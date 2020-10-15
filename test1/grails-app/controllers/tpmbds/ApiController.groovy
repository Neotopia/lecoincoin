package tpmbds

import grails.converters.JSON
import grails.converters.XML
import groovy.json.JsonBuilder

class ApiController {

    def index() {
        println request.JSON.title
        println request.JSON.price
        return response.status = 201
    }
/*
méthodes GET / PUT  / DELETE
 */

    def user() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break
            case "PUT":
                if (!params.id || !params.username || !params.password)
                    return response.status = 400
                def userInstance = User.get(params.id) //si l'id est attaché à une instance
                if (!userInstance)
                    return response.status = 404

                def map = [username: params.username, password: params.password]
                // we then bind data to the model object this way
                userInstance.properties = map
                // and save the updated user
                userInstance.save (flush: true)
                return response.status = 204
                break
            /**************************/
                // LE RENOMMAGE DE UN USER SUPPRIME AUSSI SES ANNONCES
            /*************************/
            case "DELETE":
                if(!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id) //si l'id est attaché à une instance
                if (!userInstance)
                    return response.status = 404
                userInstance.delete()
               // userInstance.save (flush: true)
                return response.status = 204
                break
            default:
                return response.status = 405
                break
        /**************************/
        // MARCHE PAS
        /*************************/
        }
        return response.status = 406
    }


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
            case "PUT":
                if (!params.id || !params.title || !params.price || !params.description || !params.longDescription ||
                        !params.author || !params.illustrations)
                    return response.status = 400
                def saleAdInstance = SaleAd.get(params.id) //si l'id est attaché à une instance
                if (!saleAdInstance)
                    return response.status = 404
                def map = [title: params.title, price: params.price, description: params.description,
                           longDescription: params.longDescription, author: params.author, illustrations: params.illustrations]
                // we then bind data to the model object this way
                saleAdInstance.properties = map
                // and save the updated user
                saleAdInstance.save (flush: true)
                return response.status = 204
                break
         /**************************/
         // MARCHE PAS
         /*************************/
            case "DELETE":
                f(!params.id)
                return response.status = 400
                def userInstance = saleAdInstance.author
                userInstance.removeFromSaleAds(saleAdInstance)
                userInstance.save(flush: true)

                def saleAdInstance = SaleAd.get(params.id) //si l'id est attaché à une instance
                if (!saleAdInstance)
                    return response.status = 404
                saleAdInstance.delete()
                return response.status = 204
                break
            default:
                return response.status = 405
                break
         /**************************/
         // MARCHE PAS
         /*************************/
        }
        return response.status = 406
    }

    /*
    méthode GET / POST
     */


    def users(){
        switch (request.getMethod()) {
            case "GET":
               /* List usersInstanceList = []
                map.collect()
                def usersInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404*/
                def ListUser= User.list()
                response.withFormat {
                    xml { render ListUser as XML }
                    json { render ListUser as JSON }
                }
                break

            case "POST":
                def userInstance = new User(username: params.username, password: params.password).save()
                UserRole.create(userInstance, Role.get(params.role), flush: true)
                break
        }
    }



    def saleAds(){

    }
}

/*

page 135

def userList = User.list()
def builder = new JsonBuilder()
// Build JSON
def result = builder.users{
    // Iterate over each user of the list
    userList.each{
        // Create new node for each
        User userInstance -> user {
            // Declare all properties
            id userInstance.id
            username userInstance.username
        }
    }
}
// Render content as String
render builder.toPrettyString()

*/




