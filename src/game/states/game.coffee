class Game

  @player = null

  create: ->
    @map = @add.tilemap 'foo'
    @map.addTilesetImage 'tileset1'
    @layer = @map.createLayer 'Tile Layer 1'
    @layer.resizeWorld()
    @map.setCollisionBetween 0, 2
    #layer.debug = true

    @player = @add.sprite @game.width/2, @game.height/4, 'player'
    @player.anchor.setTo 0.5, 0.5
    @player.scale.x = @player.scale.y = 0.3
    
    @input.onDown.add @onInputDown, this

    @physics.startSystem Phaser.Physics.ARCADE
    @physics.arcade.gravity.y = 400
    @physics.arcade.enable @player

    @cursors = @input.keyboard.createCursorKeys()

  update: ->
    @physics.arcade.collide @player, @layer

    if @cursors.left.isDown
        @player.scale.x = -0.3
        @player.body.velocity.x = -200
    else if @cursors.right.isDown
        @player.scale.x = 0.3
        @player.body.velocity.x = 200
    else
        @player.body.velocity.x = 0

    if @cursors.up.isDown and @player.body.onFloor()
        @player.body.velocity.y = -350


  controls: ->
    console.log "BAH"

  onInputDown: ->
    @game.state.start 'menu'

module.exports = Game