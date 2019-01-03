defmodule Yipcart.Email do
	import Bamboo.Email
	alias Yipcart.Mailer		
	alias Yipcart.Waiters.Entry

	def send_email(%Entry{} = entry, :inflow) do
		new_email(
			from: "ayo.aregbede@yipcart.com",
      to: "hello@yipcart.com",
      subject: "Waiting Customer",
			text_body: "#{entry.email} with the business name #{String.capitalize(entry.business_name)} has been enlisted in the waiting list."
		)
		|> Mailer.deliver_later()
	end

	def send_email(%Entry{} = entry, :outflow) do
		new_email(
			from: "hello@yipcart.com",
			to: "#{entry.email}",
			subject: "You Have Joined Our Waiting List",
			html_body: eval_file(entry.business_name)
		)
		|> Mailer.deliver_later()
	end

	defp eval_file(business_name) do
		template_path = 
			Path.expand("./lib/yipcart_web/templates/mailer/thank_you.html.eex")
		
		EEx.eval_file(template_path, [business_name: business_name])
	end
end
