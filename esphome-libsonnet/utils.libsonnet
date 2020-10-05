
{
  get_miliseconds(time)::
    if std.length(std.findSubstr('ms', time)) > 0 then
      std.strReplace(time, 'ms', '') else
      if std.length(std.findSubstr('s', time)) > 0 then
        std.strReplace(time, 's', '') + '000' else
        error 'Missing time suffix. Allowed options are ms or s.'
}

