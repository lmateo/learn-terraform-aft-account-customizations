import boto3

def client_init():
    client = boto3.client('ec2', region_name='us-east-1')
    return client

def vpc_creation(client):
    client.create_vpc(CidrBlock='172.16.0.0/16')
    
if __name__ == '__main__':
    client = client_init()
    vpc_creation(client)