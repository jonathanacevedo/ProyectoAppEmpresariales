Rails.application.config.middleware.use OmniAuth::Builder do

  provider :google_oauth2,"501771695337-5hr0s01gphu9qnnvtprgqp3bhpu3hpul.apps.googleusercontent.com","MIpMT5rlQsH0XnCIG0j_RFrF",
           scope: 'profile', image_aspect_ratio: 'square', image_size: 48, name: 'google',
           access_type: "offline", skip_jwt: true

  provider :facebook, '2143060729292907', '5bd3e81e2f7f3fe6c72110999c59ecd6'
  scope: 'public_profile', info_fields: 'id,name,link'

  OmniAuth.config.on_failure = Proc.new do |env|
    SessionsController.action(:auth_failure).call(env)
    # error_type = env['omniauth.error.type']
    # new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{error_type}"
    # [301, {'Location' => new_path, 'Content-Type' => 'text/html'}, []]
  end
end