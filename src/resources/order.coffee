resource = require '../resource'

class Order
	slug: "order"
	prefix: "/orders"

	constructor: (site) ->
		@prefix = "#{site}#{@prefix}"

	all: (params, callback) ->  
		[params, callback] = [callback, params] if typeof params is 'function'
		url = resource.queryString @prefix, params
		resource.get url, "#{@slug}s", callback

	count: (params, callback) ->
		[params, callback] = [callback, params] if typeof params is 'function'
		url = resource.queryString "#{@prefix}/count", params
		resource.get url, "count", callback

	get: (id, params, callback) ->
		[params, callback] = [callback, params] if typeof params is 'function'
		callback new Error 'missing id' unless id?
		url = resource.queryString "#{@prefix}/#{id}", params
		console.log url
		resource.get url, @slug, callback

	close: (id, callback) ->
		callback new Error 'missing id' unless id?
		url = resource.queryString "#{@prefix}/#{id}/close"
		resource.get url, @slug, callback

	open: (id, callback) ->
		callback new Error 'missing id' unless id?
		url = resource.queryString "#{@prefix}/#{id}/open"
		resource.get url, @slug, callback

	cancel: (id, params, callback) ->
		[params, callback] = [callback, params] if typeof params is 'function'
		callback new Error 'missing id' unless id?
		url = resource.queryString "#{@prefix}/#{id}/cancel", params
		resource.get url, @slug, callback
	
	update: (id, fields, callback) ->
		callback new Error 'missing id' unless id?
		url = resource.queryString "#{@prefix}/#{id}"
		resource.put url, @slug, fields, callback

	delete: (id, callback) ->
		callback new Error 'missing' unless id?
		url = resource.queryString "#{@prefix}/#{id}"
		resource.delete url, id, callback


module.exports = Order