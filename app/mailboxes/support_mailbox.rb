class SupportMailbox < ApplicationMailbox
  # Inside the process() method, we have access to the special
  # variable mail. This is an instance of Mail::Message5 and allows us to access the
  # various bits of an email you might expect to have, such as who sent it, the
  # subject, and the contents.
  def process
    recent_order = Order.where(email: mail.from_address.to_s).order('created_at desc').first
    SupportRequest.create!(
      email: mail.from_address.to_s,
      subject: mail.subject,
      body: mail.body.to_s,
      order: recent_order
    )
  end
end
