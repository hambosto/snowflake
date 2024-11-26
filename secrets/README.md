# Secret Management  

**⚠️ Warning:**  
> These are encrypted secrets. Do not use or expose this file under any circumstances.  

## Secure Your SSH Keys  

To ensure your SSH keys are secure, set the appropriate permissions for your private and public keys:  

```bash  
chmod 600 ~/.ssh/id_ed25519          # Restrict access to your private key.  
chmod 644 ~/.ssh/id_ed25519.pub      # Allow read access to your public key.  
```  

These permissions ensure that:  
- **Private Key** (`id_ed25519`): Only you (the file owner) can read or write to it.  
- **Public Key** (`id_ed25519.pub`): Read access is allowed for everyone, ensuring its usability for authentication purposes.  

## Why This Matters  

Setting incorrect permissions on SSH keys can expose sensitive data and compromise the security of your system. Always double-check the permissions of your secret files and keep them safe.