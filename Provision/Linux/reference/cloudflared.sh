Setup a new tunnel
Sign into your cloudflare account
Zero Trust -> Networks -> Tunnels -> Add Tunnel
Select the Tunnel Type as Cloudflared -> Next
Enter a name for the tunnel -> Save Tunnel
Chose the Environment -> 
	Copy the command based on whether cloudflared is already installed on the host -> 
		Run the copied command on the host ->
			Next

Pick a subdomain to host the new tunnel ->
Enter "https://localhost:port" for the service (alternativel SSH) -> 
Choose Additional Application Settings -> TLS -> No TLS Verify -> Save Tunnel
Test to make sure the tunnel is working by going to the subdomain
Test to see the tunnel listed on the host: cloudflared tunnel list
Add email authentication to the tunnel
Zero Trust -> Access -> Applications -> Add an Application
Self Hosted -> Select
Enter a name for the Application and the same subdomain as the tunnel, leave the rest -> Next
Enter "Require authorized email" as the policy name
Under Configure Rules, include these two rules:
	Include: Authentication Method: pwd - password based authentication
	Include: Emails ending in: enter the domain
Next

Enable this setting: Enable automatic cloudflared authentication
Save
Wipe clean
delete the Application
delete the Tunnel
cloudflared service uninstall
remove the CNAME records for the subdomains

