resource "aws_vpc_peering_connection" "my_vpc_peering" {
  vpc_id      = "vpc-02d11a34449d902f6"  # my-first-vpc
  peer_vpc_id = "vpc-03006a741ffb3ffe8"  # vpc2
  auto_accept = true

  tags = {
    Name = "my-first-vpc-to-vpc2"
  }
}

# Routes in first VPC route table (replace rtb-xxxx with your actual route table ID)
resource "aws_route" "route_to_vpc2" {
  route_table_id            = "rtb-0d59cc26bc23272ef"  # route table ID for my-first-vpc
  destination_cidr_block    = "10.1.0.0/16"   # CIDR of vpc2
  vpc_peering_connection_id = aws_vpc_peering_connection.my_vpc_peering.id
}

# Routes in second VPC route table (replace rtb-yyyy with your actual route table ID)
resource "aws_route" "route_to_vpc1" {
  route_table_id            = "rtb-0b8affd83275d1fdb"  # route table ID for vpc2
  destination_cidr_block    = "10.0.0.0/16"   # CIDR of my-first-vpc
  vpc_peering_connection_id = aws_vpc_peering_connection.my_vpc_peering.id
}