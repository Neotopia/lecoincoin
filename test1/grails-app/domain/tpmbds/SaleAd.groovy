package tpmbds

class SaleAd {
    String title
    String description
    String longDescription

    Date dateCreated
    Date lastUpdated

    Double price

    List illustrations //surcharge illustration en list pour que les annonces soit ordonnés

    static hasMany = [illustrations: Illustration] //collection illustration

    static belongsTo = [author: User]

    static constraints = {
        title blank: false, nullable: false
        description blank: false, nullable: false
        longDescription blank: false, nullable: false
        price min : 0d // pour que 0 est une valeur qu'on considère comme double
        illustrations nullable: true

    }

    static mapping ={
        longDescription type: 'text' //pour que le txte soit plus long que varchar limité à 255 charactères
    }
}
