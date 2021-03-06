Rails.application.config.middleware.use OmniAuth::Builder do

  provider :twitter, '9lLGY0mzERNrzsBcPRXMQ', 'y8MXFCpetLHstiXk46SxrwlY5S78BaEoj5a3Or2nj7s'
  provider :linked_in, '54lpcvck0g3c', '48fK1J3k9nw6Pp51'

  #development
  provider :facebook, '222424071230782', '902cce4522a3185b00a9bf7fa83f5334' if Rails.env.development?
  if Rails.env.production?
    if ENV['STAGING'] == 'YES'
      #staging
      provider :facebook, '459708810772153', '0b11be16b1398feea828a92243afdf7a'
    else
      #production
      provider :facebook, '460069040739570', '560cdd572efd9d5d5076c46e972a35f4'
    end
  end

end