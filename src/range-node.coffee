class RangeNode
  constructor: (@config={}, @data={}) ->
  onMessage:(message, callback=->)=>
    {min, max, value} = @config
    return callback null, message if value > min && value < max
    callback null


module.exports = RangeNode
