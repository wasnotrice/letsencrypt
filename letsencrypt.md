build-lists: true
autoscale: true
theme: Next, 0

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
- http/2 requires TLS

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

> If we make this easier, more people will do it

---

# Let's encrypt

![right](media/letsencrypt-sponsors.png)

---

# How it works

## Automate the manual steps

- [ACME](https://ietf-wg-acme.github.io/acme/) (Automatic Certificate Management Environment)
- Many [other clients](https://letsencrypt.org/docs/client-options/) available

---

# How it works

ACME client manages the challenge, verification, downloading, and renewal  of certificates. You still have to:

1. Run certbot
2. Make sure your web server can serve the challenge URL
3. Install certificates in your web server once

---

# Set up let's encrypt

1. Fire up a web server
2. Expose the ACME endpoint
3. Install let's encrypt agent (`certbot`)
4. Issue/install a certificate
5. Add certificate/key to web server config
6. Redirect http to https (optional)
7. Schedule automatic renewal (optional)

---

# Demo

---

# Thank you!

---
[.build-lists: false]
[.footer: Eric Watson, @wasnotrice]

# Resources

ACME

- https://ietf-wg-acme.github.io/acme/
- https://letsencrypt.org/docs/client-options/

Certbot

- https://certbot.eff.org
- https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04

