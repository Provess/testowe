const SftpClient = require('ssh2-sftp-client');

class SftpHelper {
  constructor() {
    this.sftpConfig = {
      host: '135.125.112.188',
      port: 22,
      username: 'root',
      password: '_x8RCZfIPeMe7oKZP55b1DR'
    };
    this.sftp = new SftpClient();
    this.connected = false; 
  }

  async connect() {
    if (!this.connected) {
      try {
        await this.sftp.connect(this.sftpConfig);
        this.connected = true; 
      } catch (err) {
        console.error('Błąd podczas nawiązywania połączenia SFTP:', err);
        throw err;
      }
    }
  }

  async disconnect() {
    if (this.connected) {
      try {
        await this.sftp.end();
        this.connected = false;
      } catch (err) {
        console.error('Błąd podczas zamykania połączenia SFTP:', err);
        throw err;
      }
    }
  }

  async listFolders(remotePath) {
    try {
      const folders = await this.sftp.list(remotePath);
      return folders.map((folder) => folder.name);
    } catch (err) {
      console.error('Błąd podczas pobierania listy folderów:', err);
      throw err;
    }
  }

  async listFiles(remotePath) {
    try {
      const files = await this.sftp.list(remotePath);
      return files.map((file) => file.name);
    } catch (err) {
      console.error('Błąd podczas pobierania listy plików:', err);
      throw err;
    }
  }

  async getFileContent(remoteFilePath) {
    try {
      const content = await this.sftp.get(remoteFilePath);
      return content.toString('utf-8');
    } catch (err) {
      console.error('Błąd podczas pobierania zawartości pliku:', err);
      throw err;
    }
  }
}

module.exports = new SftpHelper();
