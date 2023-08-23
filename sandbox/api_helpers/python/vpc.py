import boto3

def client_init():
    client = boto3.client('ec2', region_name='us-east-1')
    return client
    
def delete_vpc(client, vpc_id):
    try:
        response = client.describe_vpcs(VpcIds=[vpc_id])
        for vpc in response['Vpcs']:
            for subnet in vpc['Subnets']:
                client.delete_subnet(SubnetId=subnet['SubnetId'])
            for rt in vpc['RouteTables']:
                client.delete_route_table(RouteTableId=rt['RouteTableId'])
            for igw in vpc['InternetGateways']:
                client.detach_internet_gateway(InternetGatewayId=igw['InternetGatewayId'], VpcId=vpc_id)
                client.delete_internet_gateway(InternetGatewayId=igw['InternetGatewayId'])
            for nacl in vpc['NetworkAcls']:
                client.delete_network_acl(NetworkAclId=nacl['NetworkAclId'])
            client.delete_vpc(VpcId=vpc_id)
        print(f"VPC {vpc_id} and associated resources deleted successfully.")
    except Exception as e:
        print(f"Error deleting VPC: {str(e)}")
    
if __name__ == '__main__':
    client = client_init()
    vpc_id = 'vpc-0ea66dcb86e935a51'
    delete_vpc(client, vpc_id)