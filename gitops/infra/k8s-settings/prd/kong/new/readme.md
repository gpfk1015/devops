hbf -n serengeti-kong uninstall serengeti-kong
hif -n serengeti-kong uninstall serengeti-kong
hbf -n mgmt-kong uninstall mgmt-kong
hif -n mgmt-kong uninstall mgmt-kong
hbb -n serengeti-kong uninstall serengeti-kong
hib -n serengeti-kong uninstall serengeti-kong

hbf upgrade  --install -n serengeti-kong kong oci://<harbor prod repository_url>/helm/kong:3.0.1 -f kbf-values.yaml
hbf upgrade  --install -n mgmt-kong kong oci://<harbor prod repository_url>/helm/kong:3.0.1 -f kbf-values-mgmt.yaml
hbb upgrade  --install -n serengeti-kong kong oci://<harbor prod repository_url>/helm/kong:3.0.1 -f kbb-values.yaml
hif upgrade  --install -n serengeti-kong kong oci://<harbor prod repository_url>/helm/kong:3.0.1 -f kif-values.yaml
hif upgrade  --install -n mgmt-kong kong oci://<harbor prod repository_url>/helm/kong:3.0.1 -f kif-values-mgmt.yaml
hib upgrade  --install -n serengeti-kong kong oci://<harbor prod repository_url>/helm/kong:3.0.1 -f kib-values.yaml

