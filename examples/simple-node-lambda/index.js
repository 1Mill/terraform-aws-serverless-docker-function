exports.handler = async (event, ctx) => {
	return {
		ctx,
		event,
		message: 'Hello world!',
		message_from_env: process.env.MESSAGE,
	}
}
