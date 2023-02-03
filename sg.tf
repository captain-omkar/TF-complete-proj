resource "aws_security_group" "backend_sg" {
    name = "backend-sg"
    description = "sg for the rds and elasticcache"
    vpc_id = module.vpc.vpc_id

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        #security_groups = [aws.sg.group]

    }    
}
