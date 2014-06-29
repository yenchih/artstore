class StripeCharge

  after_reader :error_message, :response

  def initialize(options={})
    @response = options[:response]
    @error_message = options[:error_message]
  end

  def slef.create(options={})
    Stripe.api_key = Setting.stripe.secret_key
    begin
      response = Strip::Charge.create(
        :amount => options[:amount],
        :currency => "usd",
        :card => options[:card],
        :description => options[:description]
      )
      new(:response => response)
    rescue
      new(:error_message => e.message)
    end
  end

  def successful?
    @response.present?
  end
end

