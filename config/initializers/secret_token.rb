# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
	# Use the existing token.
	File.read(token_file).chomp
	else
	# Generate a new token and store it in token_file.
	token = SecureRandom.hex(64)
	File.write(token_file, token)
	token
	end
end

SampleApp::Application.config.secret_key_base = secure_token
#SampleApp::Application.config.secret_key_base = '1fa03f6bda4315572c76be105058ba914ff9bb61179760dc708dcfd33acab892bc5470ee2c7bfd7ab2a0237fffb5976a51e07bbe51926d7f5980ff95e84b9f32'
