# ~/.ssh/config

## Bastion setup
```
Host Project-Bastion
    IdentityFile C:\Users\david\Downloads\ssh-key-2020-12-20.key
    HostName <public-ip>
    User david
    ForwardAgent yes
Host target
    hostname <private-ip>
    User ubuntu
    IdentityFile C:\Users\david\Downloads\bastion-2-target.cer
    ProxyJump david@Project-Bastion
```
- The bastion host cannot have `/` (slash) in `Host` name, format such as `Project/Bastion` is prohibited
- You cannot specify the `IdentityFile` of target by a Bastion path, you need to download it to your local machine.
  - ref: https://superuser.com/questions/1323296/ssh-proxyjump-with-identityfile-in-the-proxy-only
