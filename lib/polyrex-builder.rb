#!/usr/bin/env ruby

# file: polyrex-builder.rb


require 'rexle'
require 'rexle-builder'
require 'polyrex-schema'


class PolyrexBuilder

  def initialize(rows=[], parents: [], summary: {}, 
                 rootname: 'items', debug: false)

    @debug = debug
    records = rows.map {|x|  pxify(x, parents) }
    
    summary.merge!({recordx_type: 'polyrex'})
    h = {rootname.to_sym => {summary: summary, records: records }}

    @a = RexleBuilder.new(h).to_a

  end
  
  def to_a()
    @a
  end

  def to_xml()  
    
    doc = Rexle.new(@a)
    schema = PolyrexSchema.new.parse(doc.root.xml).to_schema    
    doc.root.element('summary').add Rexle::Element.new('schema').add_text(schema)
    
    doc.xml pretty: true    
  end

  private

  def pxify(a, parents=[])

    name = parents.length <= 1 ? parents.first : parents.shift

    raw_records = a
    raw_summary = raw_records.first

    h = raw_records.first    
    summary = h.merge({schema: "%s[%s]" % [name, h.keys.join(', ')]})
    
    record = if raw_records[1] then
    

      {
        summary: summary, 
        records: raw_records[1].map{|x| pxify(x,parents.clone) }
      }

    else

      {summary: summary}

    end

    {name => record}
  end

end
