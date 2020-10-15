package tpmbds

import grails.converters.JSON
import grails.converters.XML

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
                // LE RENOMMAGE DE UN USER SUPPRIME AUSSI SES ANNONCE
            /*************************/
            case "DELETE":
                if(!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id) //si l'id est attaché à une instance
                if (!userInstance)
                    return response.status = 404
                userInstance.delete()
                userInstance.save (flush: true)
                return response.status = 204
                break
            default:
                return response.status = 405
                break
        }
        return response.status = 406
    }


    def saleAd() {

        def userInstance = saleAdInstance.author
        userInstance.removeFromSaleAds(saleAdInstance)
        userInstance.save(flush: true)
/*
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
                if (!params.id)
                    return response.status = 400
                def saleAdInstance = SaleAd.get(params.id) //si l'id est attaché à une instance
                if (!saleAdInstance)
                    return response.status = 404
                def map = [username: params.username, password: params.password]
                // we then bind data to the model object this way
                saleAdInstance.properties = map
                // and save the updated user
                saleAdInstance.save flush: true
                return response.status = 204
                break
            case "DELETE":
                f(!params.id)
                return response.status = 400
                def saleAdInstance = SaleAd.get(params.id) //si l'id est attaché à une instance
                if (!saleAdInstance)
                    return response.status = 404
                saleAdInstance.delete
                return response.status = 204
                break
            default:
                return response.status = 405
                break
        }
        return response.status = 406

 */
    }



    /*
    méthode GET / POST
     */

    def users(){

    }



    def saleAds(){

    }
}
