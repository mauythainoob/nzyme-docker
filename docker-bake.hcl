group "all_nzyme_nodes" {
  targets = ["nzyme_node_v2a9", "nzyme_node_v2a10", "nzyme_node_v2a12"]
}

group "all_nzyme_taps" {
  targets = ["nzyme_tap_v2a9", "nzyme_tap_v2a10", "nzyme_tap_v2a12"]
}


#
# Nzyme node
#
variable NZYME_NODE_DOCKER_IMAGE_NAME { 
    default = "nzyme-node"
}


target "_nzyme_node" {
    context = "nzyme_node"
    dockerfile = "Dockerfile"
    contexts = {
        base_image = "docker-image://ubuntu:22.04"
    }
    args = {       
        PORT = 22900 
        # What you'll need to update
        DOWNLOAD_TARGET = ""
    }
    ssh = ["default"]
    platforms  = ["linux/amd64"]
    
}

target "nzyme_node_v2a9" { 
    inherits = ["_nzyme_node"]
    args = {
        DOWNLOAD_TARGET = "https://github.com/nzymedefense/nzyme/releases/download/2.0.0-alpha.9/nzyme-node_2.0.0-alpha.9.deb"
    }
    tags = ["${NZYME_NODE_DOCKER_IMAGE_NAME}:v2a9"]
}

target "nzyme_node_v2a10" { 
    inherits = ["_nzyme_node"]
    args = {
        DOWNLOAD_TARGET = "https://github.com/nzymedefense/nzyme/releases/download/2.0.0-alpha.10/nzyme-node_2.0.0-alpha.10.deb"
    }
    tags = ["${NZYME_NODE_DOCKER_IMAGE_NAME}:v2a10"]
}

target "nzyme_node_v2a12" { 
    inherits = ["_nzyme_node"]
    args = {
        DOWNLOAD_TARGET = "https://github.com/nzymedefense/nzyme/releases/download/2.0.0-alpha.12/nzyme-node_2.0.0-alpha.12.deb"
    }
    tags = ["${NZYME_NODE_DOCKER_IMAGE_NAME}:v2a12"]
}

#
# Nzyme tap
#
variable NZYME_TAP_DOCKER_IMAGE_NAME { 
    default = "nzyme-tap"
}

target "_nzyme_tap" {
    context = "nzyme_tap"
    dockerfile = "Dockerfile"
    contexts = {
        base_image = "docker-image://ubuntu:22.04"
    }
    args = {       
        PORT = 22900 
        # What you'll need to update
        DOWNLOAD_TARGET = ""
    }
    ssh = ["default"]
    platforms  = ["linux/amd64"]
    tags = ["nzyme-tap:latest"]
}

target "nzyme_tap_v2a9" { 
    inherits = ["_nzyme_tap"]
    args = {
        DOWNLOAD_TARGET = "https://github.com/nzymedefense/nzyme/releases/download/2.0.0-alpha.9/nzyme-tap_2.0.0-alpha.9_ubuntu2204_amd64.deb"
    }
    tags = ["${NZYME_TAP_DOCKER_IMAGE_NAME}:v2a9"]
}

target "nzyme_tap_v2a10" { 
    inherits = ["_nzyme_tap"]
    args = {
        DOWNLOAD_TARGET = "https://github.com/nzymedefense/nzyme/releases/download/2.0.0-alpha.10/nzyme-tap_2.0.0-alpha.10_ubuntu2204_amd64.deb"
    }
    tags = ["${NZYME_TAP_DOCKER_IMAGE_NAME}:v2a10"]
}

target "nzyme_tap_v2a12" { 
    inherits = ["_nzyme_tap"]
    args = {
        DOWNLOAD_TARGET = "https://github.com/nzymedefense/nzyme/releases/download/2.0.0-alpha.12/nzyme-tap_2.0.0-alpha.12_ubuntu2204_amd64.deb"
    }
    tags = ["${NZYME_TAP_DOCKER_IMAGE_NAME}:v2a12"]
}
