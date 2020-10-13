package tpmbds

class Illustration {

    String filename

    static belongsTo = [saleAd: SaleAd]

    static constraints = {
        filename blank: false, nullable: false
    }
}
