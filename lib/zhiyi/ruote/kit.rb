require "zhiyi/ruote/kit/version"
require "ruote"
require "ruote-redis"

module Zhiyi::Ruote::Kit
  class RuoteKit
    @@engine = nil

    def self.engine
      @@engine = self.default_engine unless @@engine
    end

    def self.engine= eng
      @@engine = eng
    end

    private
    def self.default_engine
      Ruote::Engine.new(Ruote::Worker.new(Ruote::Redis::Storage.new(::Redis.new(:db => 14, :thread_safe => true), {})))
    end
  end
end
