target "nzyme-tap" {
    context = "nzyme-tap"
    dockerfile = "Dockerfile"
    contexts = {
        base_image = "docker-image://ubuntu:22.04"
    }
    args = {       
        DOWNLOAD_TARGET = "https://github.com/nzymedefense/nzyme/releases/download/2.0.0-alpha.10/nzyme-tap_2.0.0-alpha.10_ubuntu2204_amd64.deb"
    }
    ssh = ["default"]
    platforms  = ["linux/amd64"]
    tags = ["nzyme-tap:latest"]
}

target "nzyme-node" {
    context = "nzyme-node"
    dockerfile = "Dockerfile"
    contexts = {
        base_image = "docker-image://ubuntu:22.04"
    }
    args = {       
        PORT = 22900 
        DOWNLOAD_TARGET = "https://github.com/nzymedefense/nzyme/releases/download/2.0.0-alpha.10/nzyme-node_2.0.0-alpha.10.deb"
    }
    ssh = ["default"]
    platforms  = ["linux/amd64"]
    tags = ["nzyme-node:latest"]
}