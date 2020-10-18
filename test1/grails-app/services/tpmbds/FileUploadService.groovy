package tpmbds

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile
import grails.web.context.ServletContextHolder

// Ce code provient de https://fr.slideshare.net/cavneb/upload-files-with-grails

@Transactional
class FileUploadService {

    def String uploadFile(MultipartFile file, String name, String destinationDirectory){
        def servletContext = ServletContextHolder.servletContext
        def storagePath = servletContext.getRealPath(destinationDirectory)

        def storagePathDirectory = new File(storagePath)
        if(!storagePathDirectory.exists()){
            print "CREATING DIRECTORY ${storagePath}: "
            if(storagePathDirectory.mkdirs()){
                println "SUCCESS"
            } else {
                println "FAILED"
            }
        }

        if(!file.isEmpty()){
            file.transferTo(new File("${storagePath}/${name}"))
            println "Saved file: ${storagePath}/${name}"
            return "${storagePath}/${name}"
        } else {
            println "File ${file.inspect()} was empty!"
            return null
        }
    }
}
