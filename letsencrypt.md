build-lists: true
autoscale: true

# Let's encrypt

#### twin ports web pros
#### eric watson
#### april 2017

---

![](media/encrypt-all-the-things.jpg)

---

# Why encrypt?

---

# Benefits of TLS

- guarantees content integrity
- prevents eavesdropping
- prevents man-in-the-middle attacks
- prevents replay attacks
- improved search engine rankings

---

# The old way

---

![fit](media/godaddy.png)

---

# Problems

- cost: $60/year and up
- certificates expire
- process is manual and error-prone

---

# Annual manual steps

1. Generate a Certificate Signing Request (CSR)
2. Cut and paste your CSR into the certificate authority (CA) web page
3. Prove ownership of your domain by publishing the CA's "challenge"
4. Download the new certificate and install it on the web server

---

# The insight

> If we make this easier, more people will do it

---

# Let's encrypt

![right](media/letsencrypt-sponsors.png)

---

# How it works

## Automate the manual steps

- [ACME](https://ietf-wg-acme.github.io/acme/) (Automatic Certificate Management Environment)
- Many [clients available](https://letsencrypt.org/docs/client-options/) besides default

---

# HTTP/2 is coming

## and it's https:// only

---

# Set up let's encrypt

1. Fire up a web server
2. Install let's encrypt agent, (`certbot`)
3. Expose the ACME endpoint
4. Install a certificate
5. Redirect http to https (optional)
6. Schedule automatic renewal (optional)

---

# Demo

---

add DNS out-of-band

- http.citizen.io
- htts.citizen.io

1. Add user

```
adduser eric
usermod -aG sudo eric
```

2. Copy public key

```
ssh-copy-id eric@server_ip
```

Disable password login

```
sudo vim /etc/ssh/sshd_config
```

```
PasswordAuthentication no
PubkeyAuthentication yes
ChallengeResponseAuthentication no
```

```
sudo systemctl reload sshd
```

Firewall

```
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status
```
```
---

# Thank you!

---

# Resources

ACME

- https://ietf-wg-acme.github.io/acme/
- https://letsencrypt.org/docs/client-options/

SEO

- https://support.google.com/webmasters/answer/6073543?hl=en


