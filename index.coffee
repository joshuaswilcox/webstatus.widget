#command: 'source $HOME/.bash_profile && ./webstatus.widget/script.sh'
command: 'source $HOME/.bash_profile && ruby ./webstatus.widget/webstatus.rb'

refreshFrequency: 36000

style: """
  top: 10px
  left: 640px
  font-family: Helvetica Neue
  text-align:right
  color: #fff

  .node
    display: inline-block
    margin: 0px 10px
    text-align: center
    opacity: .5

  .name
    font-size: 13px

  .circle
    width:50px
    height:50px
    border-radius:25px
    font-size:18px
    color:#fff
    line-height:50px
    text-align:center
    background:#000

  .up
    background: green

  .down
    background: red
"""
render: -> """
  <div class="status"></div>
"""
update: (output, domEl) ->
  container = $(domEl).find('.status')
  container.html ''
  $.each JSON.parse(output), (idx, obj) ->
    if obj.code == '200'
      status = 'up'
    else
      status = 'down'

    container.append "<div class='node'><p class='circle #{status}'>#{obj.code}</p><p class='name'>#{obj.short_name}</p></div>"
    return
