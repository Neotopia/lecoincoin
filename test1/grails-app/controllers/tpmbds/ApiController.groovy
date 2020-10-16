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
                if (!params.id)
                    return response.status = 400

                def userInstance = User.get(params.id) //si l'id est attaché à une instance
                if (!userInstance)
                    return response.status = 404

                def map = [username: request.JSON.username, params: request.JSON.password]
                userInstance.properties = map
                userInstance.save (flush: true)
                return response.status = 204
                break
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



        }
        return response.status = 406
    }

    /*
    méthode GET / POST
     */


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




/*
ZONE DE TEST

GET USER :

http://localhost:8081/tpmbds/api/user/2

PATCH USER :

http://localhost:8081/tpmbds/api/user/2

{
    "username":"Nico",
    "password":"password"
}

http://localhost:8081/tpmbds/api/user?id=2&username=Nico&password=password

DELETE USER :



GET USERS :



POST USER :



GET SALEAD :

http://localhost:8081/tpmbds/api/saleAd/2

PATCH SALEAD :



DELETE SALEAD :



GET SALEADS :



POST SALEAD :


 */

