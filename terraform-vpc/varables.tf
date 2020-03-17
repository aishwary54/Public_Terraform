variable "AWS_REGION" {    
    default = "us-east-2"
}

variable "AMI" {
    type = "map"
    
    default {
        us-east-2 = "ami-03dea29b0216a1e03"
        us-east-1 = "ami-0c2a1acae6667e438"
    }
}

variable PUBLIC_KEY_PATH{
	default=""
}