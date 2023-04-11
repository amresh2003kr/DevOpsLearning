#!/bin/bash

# Default values
password=""
algo="all"
text=""

read -p "Algo Type (MD5/SHA1/SHA256/SHA512/BCRYPT/ALL): " algo
read -p "Text: " text
read -p "Password: " password

# Generate random password if password is not provided
if [ -z $password ]
then
	    password=$(openssl rand -base64 $length)
fi

# Encrypt password using selected algorithms

# The MD5 (message-digest algorithm) hashing algorithm is a one-way cryptographic function
#		that accepts a message of any length as input and returns as output a fixed-length digest 
#		value to be used for authenticating the original message.
if [ $algo == "all" ] || [ $algo == "md5" ]
then
	    echo "MD5: $(echo -n $password | md5sum | awk '{print $1}')"
fi

# SHA-1 or Secure Hash Algorithm 1 is a cryptographic hash function which takes an input 
#		and produces a 160-bit (20-byte) hash value. This hash value is known as a message digest.
#		This message digest is usually then rendered as a hexadecimal number which is 40 digits long.
if [ $algo == "all" ] || [ $algo == "sha1" ]
then
	    echo "SHA1: $(echo -n $password | sha1sum | awk '{print $1}')"
fi

# SHA-256 (Secure Hash Algorithm 256-bit) is a cryptographic hash function that is 
#		used to generate a fixed-size 256-bit (32-byte) hash value from an input (or 'message'). 
#		It is commonly used to verify the integrity of data, such as a file or message, 
#		by generating a hash value from the original data and comparing it to awww hash value received from the sender. 
if [ $algo == "all" ] || [ $algo == "sha256" ]
then
	    echo "SHA256: $(echo -n $password | sha256sum | awk '{print $1}')"
fi

# The SHA 512 algorithm is an algorithm that uses the one-way hash function. 
# 		SHA 512 hash function generates message diggest 512-bit size and 1024 bit block length.
if [ $algo == "all" ] || [ $algo == "sha512" ]
then
	    echo "SHA512: $(echo -n $password | sha512sum | awk '{print $1}')"
fi

# BCrypt Algorithm is used to hash and salt passwords securely. 
#		BCrypt permits building a password security stage that can advance nearby 
#		hardware innovation to guard against dangers or threats in the long run, like 
#		attackers having the computing power to guess passwords twice as quickly.
#		The input to the bcrypt function is the password string (up to 72 bytes), 
#		a numeric cost, and a 16-byte (128-bit) salt value. The salt is typically a random value. 
#		The bcrypt function uses these inputs to compute a 24-byte (192-bit) hash.
if [ $algo == "all" ] || [ $algo == "bcrypt" ]
then
	    echo "BCRYPT: $(echo -n $password | bcrypt)"
fi

