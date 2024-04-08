group "all_nzyme_nodes" {
  targets = ["nzyome_node_v2a9", "nzyome_node_v2a10"]
}

variable NODE_DOCKER_IMAGE_NAME { 
    default = "nzyme-node"
}

target "nzyme_tap" {
    context = "nzyme_tap"
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

target "_nzyme_node" {
    context = "nzyme_node"
    dockerfile = "Dockerfile"
    contexts = {
        base_image = "docker-image://ubuntu:22.04"
    }
    args = {       
        PORT = 22900 
    }
    ssh = ["default"]
    platforms  = ["linux/amd64"]
    
}

target "nzyome_node_v2a9" { 
    inherits = ["_nzyme_node"]
    args = {
        DOWNLOAD_TARGET = "https://github.com/nzymedefense/nzyme/releases/download/2.0.0-alpha.9/nzyme-node_2.0.0-alpha.9.deb"
    }
    tags = ["${NODE_DOCKER_IMAGE_NAME}:v2a9"]
}

target "nzyome_node_v2a10" { 
    inherits = ["_nzyme_node"]
    args = {
        DOWNLOAD_TARGET = "https://github.com/nzymedefense/nzyme/releases/download/2.0.0-alpha.10/nzyme-node_2.0.0-alpha.10.deb"
    }
    tags = ["${NODE_DOCKER_IMAGE_NAME}:v2a10"]
}

