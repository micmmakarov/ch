Rails.application.config.middleware.use OmniAuth::Builder do

  provider :twitter, '9lLGY0mzERNrzsBcPRXMQ', 'y8MXFCpetLHstiXk46SxrwlY5S78BaEoj5a3Or2nj7s'
  provider :linked_in, '54lpcvck0g3c', '48fK1J3k9nw6Pp51'

  #development
  provider :facebook, '222424071230782', '902cce4522a3185b00a9bf7fa83f5334' if Rails.env.development?
  #production
  provider :facebook, '157502194406861', 'a38f27ac0ffe39e1f91c4efa45991ea6' if Rails.env.production?

end