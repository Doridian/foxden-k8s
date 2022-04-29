#!/bin/sh
kubectl delete secret -n mastodon mastodon-env
kubectl create secret generic -n mastodon mastodon-env --from-env-file=.\mastodon\mastodon-secrets.env

kubectl delete secret -n mastodon mastodon-twitter-poster-env
kubectl create secret generic -n mastodon mastodon-twitter-poster-env --from-env-file=.\mastodon\mastodon-twitter-poster-secrets.env
