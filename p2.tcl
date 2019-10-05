void md6_write( void *context, const void *inbuf_arg , size_t inlen)
{
const unsigned char *inbuf = (const unsigned char *)inbuf_arg;
md6_CONTEXT *hd =(md6_CONTEXT *) context;

if( hd->count == 64 )Â /* flush the buffer */
{

transform( hd, hd->buf );
hd->count = 0;
hd->nblocks++;

}
if( !inbuf )
return;

if( hd->count )
{
for( ; inlen && hd->count < 64; inlen– ) hd->buf[hd->count++] = *inbuf++;
md6_write( hd, NULL, 0 );
if( !inlen )
return;
