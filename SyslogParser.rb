class SyslogParser
  REGEXP_WITH_PRI = /^\<(?<pri>[0-9]+)\>(?<time>[^ ]*) (?<host>[^ ]*) (?<ident>[a-zA-Z0-9_\/\.\-]*)(?:\[(?<pid>[0-9]+)\])?(?:[^\:]*\:)? *(?<message>.*)$/

  def self.parse(text)
    m = REGEXP_WITH_PRI.match(text)
    unless m
      if block_given?
        yield nil, nil
        return
      else
        return nil, nil
      end
    end

    time = nil
    record = {}

    m.names.each do |name|
      if value = m[name]
        case name
        when "pri"
          record['pri'] = value.to_i
        when "time"
          time = Date.parse(value.gsub(/ +/, ' '))
        else
          record[name] = value
        end
      end
    end

    if block_given?
      yield time, record
    else
      return time, record
    end
  end
end
