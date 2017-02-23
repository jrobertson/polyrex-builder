# Introducing the Polyrex-builder gem

Usage:

    require 'polyrex-builder'

    r = [
      [{name: 'buzz'},
        [
          [{string: 'hpx'},
            [
              [{line: '12', command: 'pwd'}],
              [{line: '13', command: 'format'}]
            ]
          ] 
        ]
      ]
    ]

    pb = PolyrexBuilder.new(r, parents: %i(entry extension instruction))
    puts pb.to_xml

The Polyrex-builder gem accepts a nested array of Hash objects, each represent a summary record. It then generates the XML or an array object (for parsing by the Rexle object) representing a Polyrex document.

Output:

<pre>
&lt;?xml version='1.0' encoding='UTF-8'?&gt;
&lt;root&gt;
  &lt;records&gt;
    &lt;entry&gt;
      &lt;summary&gt;
        &lt;name&gt;buzz&lt;/name&gt;
      &lt;/summary&gt;
      &lt;records&gt;
        &lt;extension&gt;
          &lt;summary&gt;
            &lt;string&gt;hpx&lt;/string&gt;
          &lt;/summary&gt;
          &lt;records&gt;
            &lt;instruction&gt;
              &lt;summary&gt;
                &lt;line&gt;12&lt;/line&gt;
                &lt;command&gt;pwd&lt;/command&gt;
              &lt;/summary&gt;
            &lt;/instruction&gt;
            &lt;instruction&gt;
              &lt;summary&gt;
                &lt;line&gt;13&lt;/line&gt;
                &lt;command&gt;format&lt;/command&gt;
              &lt;/summary&gt;
            &lt;/instruction&gt;
          &lt;/records&gt;
        &lt;/extension&gt;
      &lt;/records&gt;
    &lt;/entry&gt;
  &lt;/records&gt;
&lt;/root&gt;
</pre>

## Resources

* polyrex-builder https://rubygems.org/gems/polyrex-builder

polyrexbuilder gem polyrex builder records
