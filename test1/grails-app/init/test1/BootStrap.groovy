package test1

import tpmbds.Illustration
import tpmbds.Role
import tpmbds.SaleAd
import tpmbds.User
import tpmbds.UserRole

class BootStrap {

    def init = { servletContext ->
        //creer les roles
        def roleAdmin = new Role(authority: "ROLE_ADMIN").save()
        def roleUser = new Role(authority: "ROLE_USER").save()

        def userAdmin = new User(username: "admin", password: "password").save()
        def userClient = new User(username: "user", password: "password").save()

        UserRole.create(userAdmin, roleAdmin, true)
        UserRole.create(userClient, roleUser,  true)

                (1..5).each {
                    Integer index ->
                    def annonceInstance = new SaleAd(
                        title: "title " + index,
                        description: "description " + index,
                        longDescription: "description " + index,
                        price: 100F * index)
                (1..3).each{
                    annonceInstance.addToIllustrations(new Illustration(filename: "https://picsum.photos/200/300"))
                }

                userClient.addToSaleAds(annonceInstance)
         }
        userClient.save(flush: true, failOnError: true)
    }
    def destroy = {
    }
}
