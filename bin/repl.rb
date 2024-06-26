# frozen_string_literal: true

require 'colored'

# Fancy
WELCOME = <<-'YGM'
   __ __   ___   __ __  ____    ____    ___  ___ ___  ____    ____  ___ ___    ___
  |  |  | /   \ |  |  ||    \  /    |  /  _]|   |   ||    \  /    ||   |   |  /  _]
  |  |  ||     ||  |  ||  D  )|   __| /  [_ | _   _ ||  _  ||  o  || _   _ | /  [_
  |  ~  ||  O  ||  |  ||    / |  |  ||    _]|  \_/  ||  |  ||     ||  \_/  ||    _]
  |___, ||     ||  :  ||    \ |  |_ ||   [_ |   |   ||  |  ||  _  ||   |   ||   [_
  |     ||     ||     ||  .  \|     ______     ______     ______   __      ||     |
  |____/  \___/  \__,_||__|\_||___ /\  == \   /\  ___\   /\  == \ /\ \  ___||_____|
                                   \ \  __<   \ \  __\   \ \  _-/ \ \ \____
                                    \ \_\ \_\  \ \_____\  \ \_\    \ \_____\
                                     \/_/ /_/   \/_____/   \/_/     \/_____/
YGM

puts WELCOME.green
