defmodule Yipcart.Email do
	import Bamboo.Email
	alias Yipcart.Mailer

	def send_email(receipient, business_name) do
		new_email(
			from: receipient,
      to: "opeyemi.badmos@yipcart.com",
      subject: "Waiting Customer",
			text_body: "#{receipient} with the business name #{String.capitalize(business_name)} has been enlisted in the waiting list."
		)
		|> Mailer.deliver_later()
	end
end
