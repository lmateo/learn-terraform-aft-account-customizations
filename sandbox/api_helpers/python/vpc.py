i""" mport boto3

def client_init():
    client = boto3.client('ec2', region_name='us-east-1')
    return client

def vpc_creation(client):
    client.create_vpc(CidrBlock='172.16.0.0/16')
    
def vpc_deletion(client, vpc_id):
    client.delete_vpc(VpcId=vpc_id)
    
if __name__ == '__main__':
    client = client_init()
    vpc_id = 'vpc-09b45fb755f07d73f'
    vpc_deletion(client, vpc_id) """
    
