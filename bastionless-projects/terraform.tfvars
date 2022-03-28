regions      = "us-east-1"
vpc_cidrs    = "66.16.0.0/16"
zones        = ["us-east-1a", "us-east-1b", "us-east-1c"]
ports        = [22, 80, 443, 3306]
publicsbnts  = ["66.16.100.0/24", "66.16.101.0/24", "66.16.102.0/24"]
privatesbnts = ["66.16.60.0/24", "66.16.61.0/24", "66.16.62.0/24"]
tags1        = ["public1", "public2", "public3"]
tags2        = ["private1", "private2", "private3"]

routetable1tags = {
  "table1a" = "public_rtable1",
  "table1b" = "public_rtable2",
  "table1c" = "public_rtable3"
}

routetable2tags = {
  "orivtable1a" = "private_rtable1",
  "orivtable1b" = "private_rtable2",
  "orivtable1c" = "private_rtable3"
}

vpctags1 = "myvpc"

tools = {
  "ami1"      = "ami-033b95fb8079dc481",
  "inststype" = "t2.micro",
  "keys1"     = "keys1role"
}