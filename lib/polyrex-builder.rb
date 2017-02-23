#!/usr/bin/env ruby

# file: polyrex-builder.rb


require 'rexle'
require 'rexle-builder'


class PolyrexBuilder

  def initialize(rows=[], parents: [])

    records = rows.map {|x|  pxify(x, parents) }
    
    h = {records: records }

    @a = RexleBuilder.new(h).to_a

  end
  
  def to_a()
    @a
  end

  def to_xml()  
    Rexle.new(@a).xml pretty: true    
  end

  private

  def pxify(a, parents=[])

    name = parents.shift

    raw_records = a
    raw_summary = raw_records.first

    record = if raw_records[1] then

      {
        summary: raw_records.first, 
        records: raw_records[1].map{|x| pxify(x,parents.clone) }
      }

    else

      {summary: raw_records.first}

    end

    {name => record}
  end

end
