# -*- coding: utf-8 -*-

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

    # ------------------------------------------------------------
    # 通过一组参与者寻找其全部任务
    # ------------------------------------------------------------
    def self.by_participants ps
      ps.map do |p|
        RuoteKit.engine.storage_participant.by_participant(ps)
      end.flatten.compact.uniq
    end

    private
    def self.default_engine
      Ruote::Engine.new(Ruote::Worker.new(Ruote::Redis::Storage.new(::Redis.new(:db => 14, :thread_safe => true), {})))
    end
  end


  # ------------------------------------------------------------
  # 业务模型基类
  # ------------------------------------------------------------
  class BusinessModel
    attr_accessor :model, :model_id

    def initialize o
      @model = o.class.name
      @model_id = o.id.to_s
    end

    def to_json
      { model: @model, model_id: @model_id }.to_json
    end

    def to_object
      @model.constantize.find(@model_id)
    end
  end
end
