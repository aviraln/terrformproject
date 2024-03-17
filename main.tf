provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}
provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}

module "vpc" {
  providers = {
    aws = aws.mumbai
  }
  source  = "./modules/vpc"
  cidr    = "10.0.0.0/16"
  vpcname = "mumbaivpc"

}

module "Subnet1" {
  source  = "./modules/subnet"
  vpcid   = module.vpc.vpcid
  cidr    = "10.0.1.0/24"
  avazone = "ap-south-1a"
  name    = "Public Subnet1"
}

module "Subnet2" {
  source  = "./modules/subnet"
  vpcid   = module.vpc.vpcid
  cidr    = "10.0.2.0/24"
  avazone = "ap-south-1b"
  name    = "Public Subnet2"
}

module "Subnet3" {
  source  = "./modules/subnet"
  vpcid   = module.vpc.vpcid
  cidr    = "10.0.3.0/24"
  avazone = "ap-south-1a"
  name    = "Private Subnet1"
}

module "Subnet4" {
  source  = "./modules/subnet"
  vpcid   = module.vpc.vpcid
  cidr    = "10.0.4.0/24"
  avazone = "ap-south-1b"
  name    = "Private Subnet2"
}

module "igw" {
  source = "./modules/igw"
  vpcid  = module.vpc.vpcid
}

module "prvrt" {
  source = "./modules/routetable"
  vpcid  = module.vpc.vpcid
  name   = "Private"
}

module "pub_route" {
  source    = "./modules/pubroute"
  rtid      = module.vpc.default_rt
  dest_cdir = "0.0.0.0/0"
  igw       = module.igw.igwid
}

module "pubasso1" {
  source = "./modules/association"
  rtid   = module.vpc.default_rt
  subid  = module.Subnet2.subid
}
module "pubasso2" {
  source = "./modules/association"
  rtid   = module.vpc.default_rt
  subid  = module.Subnet1.subid
}

module "priasso1" {
  source = "./modules/association"
  rtid   = module.prvrt.rtid
  subid  = module.Subnet3.subid
}
module "priasso2" {
  source = "./modules/association"
  rtid   = module.prvrt.rtid
  subid  = module.Subnet4.subid
}

module "eip1" {
  source = "./modules/elasticip"
}
module "eip2" {
  source = "./modules/elasticip"
}

module "natgateway1" {
  source = "./modules/nat"
  allid  = module.eip1.eipid
  subid  = module.Subnet3.subid
  name   = "nat1"
}

module "natgateway2" {
  source = "./modules/nat"
  allid  = module.eip2.eipid
  subid  = module.Subnet4.subid
  name   = "nat2"
}

module "my_nacl" {
  source = "./modules/nacl"
  vpcid  = module.vpc.vpcid
  name   = "myNacl1"
}

module "naclasso1" {
  source = "./modules/naclassociation"
  naclid = module.my_nacl.naclid
  subid  = module.Subnet1.subid
}

module "naclasso2" {
  source = "./modules/naclassociation"
  naclid = module.my_nacl.naclid
  subid = module.Subnet2.subid
}

module "naclasso3" {
  source = "./modules/naclassociation"
  naclid = module.my_nacl.naclid
  subid  = module.Subnet3.subid
}

module "naclasso4" {
  source = "./modules/naclassociation"
  naclid = module.my_nacl.naclid
  subid  = module.Subnet4.subid
}

