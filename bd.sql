PGDMP  ,    &            
    |            asur    16.4    16.4 
   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25025    asur    DATABASE     x   CREATE DATABASE asur WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE asur;
                postgres    false            �            1259    25059    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         heap    postgres    false            �            1259    46436    asd    TABLE       CREATE TABLE public.asd (
    id integer NOT NULL,
    nombre text,
    proveedor text,
    cantidad integer,
    precio double precision,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.asd;
       public         heap    postgres    false            �            1259    46435 
   asd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.asd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.asd_id_seq;
       public          postgres    false    221            �           0    0 
   asd_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.asd_id_seq OWNED BY public.asd.id;
          public          postgres    false    220            �            1259    44814 	   productos    TABLE     1  CREATE TABLE public.productos (
    id integer NOT NULL,
    proveedor text,
    precio double precision,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    unidad text,
    nombre text,
    cantdad integer
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    47278    productos_chinos    TABLE     /  CREATE TABLE public.productos_chinos (
    id integer NOT NULL,
    nombre text,
    proveedosr text,
    cantidad_varia integer,
    precio double precision,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 $   DROP TABLE public.productos_chinos;
       public         heap    postgres    false            �            1259    47277    productos_chinos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_chinos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.productos_chinos_id_seq;
       public          postgres    false    223            �           0    0    productos_chinos_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.productos_chinos_id_seq OWNED BY public.productos_chinos.id;
          public          postgres    false    222            �            1259    44813    productos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.productos_id_seq;
       public          postgres    false    219            �           0    0    productos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;
          public          postgres    false    218            �            1259    49444    productos_patitos    TABLE     9  CREATE TABLE public.productos_patitos (
    id integer NOT NULL,
    nombre text,
    precio double precision,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    proveedor text,
    cantdad integer,
    unidad text
);
 %   DROP TABLE public.productos_patitos;
       public         heap    postgres    false            �            1259    49443    productos_patitos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_patitos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.productos_patitos_id_seq;
       public          postgres    false    225            �           0    0    productos_patitos_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.productos_patitos_id_seq OWNED BY public.productos_patitos.id;
          public          postgres    false    224            �            1259    25086    users    TABLE     <  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    25085    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216            l           2604    46439    asd id    DEFAULT     `   ALTER TABLE ONLY public.asd ALTER COLUMN id SET DEFAULT nextval('public.asd_id_seq'::regclass);
 5   ALTER TABLE public.asd ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            i           2604    44817    productos id    DEFAULT     l   ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);
 ;   ALTER TABLE public.productos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            o           2604    47281    productos_chinos id    DEFAULT     z   ALTER TABLE ONLY public.productos_chinos ALTER COLUMN id SET DEFAULT nextval('public.productos_chinos_id_seq'::regclass);
 B   ALTER TABLE public.productos_chinos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            r           2604    49447    productos_patitos id    DEFAULT     |   ALTER TABLE ONLY public.productos_patitos ALTER COLUMN id SET DEFAULT nextval('public.productos_patitos_id_seq'::regclass);
 C   ALTER TABLE public.productos_patitos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            h           2604    25089    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �          0    25059    SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          postgres    false    215   �@      �          0    46436    asd 
   TABLE DATA           `   COPY public.asd (id, nombre, proveedor, cantidad, precio, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    221   .A      �          0    44814 	   productos 
   TABLE DATA           m   COPY public.productos (id, proveedor, precio, "createdAt", "updatedAt", unidad, nombre, cantdad) FROM stdin;
    public          postgres    false    219   �A      �          0    47278    productos_chinos 
   TABLE DATA           t   COPY public.productos_chinos (id, nombre, proveedosr, cantidad_varia, precio, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    223   �A      �          0    49444    productos_patitos 
   TABLE DATA           u   COPY public.productos_patitos (id, nombre, precio, "createdAt", "updatedAt", proveedor, cantdad, unidad) FROM stdin;
    public          postgres    false    225   B      �          0    25086    users 
   TABLE DATA           ^   COPY public.users (id, name, email, username, password, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    217   iB      �           0    0 
   asd_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.asd_id_seq', 1, true);
          public          postgres    false    220            �           0    0    productos_chinos_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.productos_chinos_id_seq', 1, false);
          public          postgres    false    222            �           0    0    productos_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.productos_id_seq', 2, true);
          public          postgres    false    218            �           0    0    productos_patitos_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.productos_patitos_id_seq', 3, true);
          public          postgres    false    224            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 7, true);
          public          postgres    false    216            v           2606    25063     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            postgres    false    215            <           2606    46445    asd asd_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.asd
    ADD CONSTRAINT asd_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.asd DROP CONSTRAINT asd_pkey;
       public            postgres    false    221            >           2606    47287 &   productos_chinos productos_chinos_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.productos_chinos
    ADD CONSTRAINT productos_chinos_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.productos_chinos DROP CONSTRAINT productos_chinos_pkey;
       public            postgres    false    223            @           2606    49453 (   productos_patitos productos_patitos_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.productos_patitos
    ADD CONSTRAINT productos_patitos_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.productos_patitos DROP CONSTRAINT productos_patitos_pkey;
       public            postgres    false    225            :           2606    44823    productos productos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    219            x           2606    50907    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    217            z           2606    50909    users users_email_key1 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key1;
       public            postgres    false    217            |           2606    50991    users users_email_key10 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key10 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key10;
       public            postgres    false    217            ~           2606    50953    users users_email_key100 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key100 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key100;
       public            postgres    false    217            �           2606    50969    users users_email_key101 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key101 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key101;
       public            postgres    false    217            �           2606    50955    users users_email_key102 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key102 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key102;
       public            postgres    false    217            �           2606    50967    users users_email_key103 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key103 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key103;
       public            postgres    false    217            �           2606    50957    users users_email_key104 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key104 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key104;
       public            postgres    false    217            �           2606    50965    users users_email_key105 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key105 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key105;
       public            postgres    false    217            �           2606    50959    users users_email_key106 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key106 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key106;
       public            postgres    false    217            �           2606    50963    users users_email_key107 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key107 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key107;
       public            postgres    false    217            �           2606    50961    users users_email_key108 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key108 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key108;
       public            postgres    false    217            �           2606    50797    users users_email_key109 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key109 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key109;
       public            postgres    false    217            �           2606    51009    users users_email_key11 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key11 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key11;
       public            postgres    false    217            �           2606    51017    users users_email_key110 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key110 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key110;
       public            postgres    false    217            �           2606    50795    users users_email_key111 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key111 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key111;
       public            postgres    false    217            �           2606    51011    users users_email_key12 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key12 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key12;
       public            postgres    false    217            �           2606    50905    users users_email_key13 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key13 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key13;
       public            postgres    false    217            �           2606    51013    users users_email_key14 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key14 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key14;
       public            postgres    false    217            �           2606    50801    users users_email_key15 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key15 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key15;
       public            postgres    false    217            �           2606    51015    users users_email_key16 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key16 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key16;
       public            postgres    false    217            �           2606    50799    users users_email_key17 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key17 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key17;
       public            postgres    false    217            �           2606    50929    users users_email_key18 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key18 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key18;
       public            postgres    false    217            �           2606    50931    users users_email_key19 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key19 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key19;
       public            postgres    false    217            �           2606    50919    users users_email_key2 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key2 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key2;
       public            postgres    false    217            �           2606    50979    users users_email_key20 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key20 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key20;
       public            postgres    false    217            �           2606    50937    users users_email_key21 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key21 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key21;
       public            postgres    false    217            �           2606    50977    users users_email_key22 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key22 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key22;
       public            postgres    false    217            �           2606    50933    users users_email_key23 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key23 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key23;
       public            postgres    false    217            �           2606    50935    users users_email_key24 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key24 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key24;
       public            postgres    false    217            �           2606    50903    users users_email_key25 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key25 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key25;
       public            postgres    false    217            �           2606    50849    users users_email_key26 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key26 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key26;
       public            postgres    false    217            �           2606    50851    users users_email_key27 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key27 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key27;
       public            postgres    false    217            �           2606    50901    users users_email_key28 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key28 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key28;
       public            postgres    false    217            �           2606    50899    users users_email_key29 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key29 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key29;
       public            postgres    false    217            �           2606    50921    users users_email_key3 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key3 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key3;
       public            postgres    false    217            �           2606    50875    users users_email_key30 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key30 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key30;
       public            postgres    false    217            �           2606    50897    users users_email_key31 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key31 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key31;
       public            postgres    false    217            �           2606    50877    users users_email_key32 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key32 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key32;
       public            postgres    false    217            �           2606    50895    users users_email_key33 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key33 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key33;
       public            postgres    false    217            �           2606    50879    users users_email_key34 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key34 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key34;
       public            postgres    false    217            �           2606    50881    users users_email_key35 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key35 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key35;
       public            postgres    false    217            �           2606    50893    users users_email_key36 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key36 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key36;
       public            postgres    false    217            �           2606    50883    users users_email_key37 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key37 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key37;
       public            postgres    false    217            �           2606    50891    users users_email_key38 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key38 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key38;
       public            postgres    false    217            �           2606    50889    users users_email_key39 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key39 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key39;
       public            postgres    false    217            �           2606    50923    users users_email_key4 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key4 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key4;
       public            postgres    false    217            �           2606    50885    users users_email_key40 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key40 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key40;
       public            postgres    false    217            �           2606    50887    users users_email_key41 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key41 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key41;
       public            postgres    false    217            �           2606    51007    users users_email_key42 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key42 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key42;
       public            postgres    false    217            �           2606    50993    users users_email_key43 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key43 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key43;
       public            postgres    false    217            �           2606    50999    users users_email_key44 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key44 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key44;
       public            postgres    false    217            �           2606    51005    users users_email_key45 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key45 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key45;
       public            postgres    false    217            �           2606    51001    users users_email_key46 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key46 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key46;
       public            postgres    false    217            �           2606    51003    users users_email_key47 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key47 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key47;
       public            postgres    false    217            �           2606    50997    users users_email_key48 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key48 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key48;
       public            postgres    false    217            �           2606    50995    users users_email_key49 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key49 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key49;
       public            postgres    false    217            �           2606    50925    users users_email_key5 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key5 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key5;
       public            postgres    false    217            �           2606    50911    users users_email_key50 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key50 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key50;
       public            postgres    false    217            �           2606    50917    users users_email_key51 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key51 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key51;
       public            postgres    false    217            �           2606    50913    users users_email_key52 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key52 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key52;
       public            postgres    false    217            �           2606    50915    users users_email_key53 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key53 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key53;
       public            postgres    false    217            �           2606    50873    users users_email_key54 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key54 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key54;
       public            postgres    false    217            �           2606    50853    users users_email_key55 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key55 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key55;
       public            postgres    false    217            �           2606    50871    users users_email_key56 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key56 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key56;
       public            postgres    false    217            �           2606    50869    users users_email_key57 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key57 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key57;
       public            postgres    false    217            �           2606    50855    users users_email_key58 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key58 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key58;
       public            postgres    false    217            �           2606    50857    users users_email_key59 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key59 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key59;
       public            postgres    false    217                        2606    50927    users users_email_key6 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key6 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key6;
       public            postgres    false    217                       2606    50867    users users_email_key60 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key60 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key60;
       public            postgres    false    217                       2606    50865    users users_email_key61 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key61 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key61;
       public            postgres    false    217                       2606    50859    users users_email_key62 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key62 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key62;
       public            postgres    false    217                       2606    50861    users users_email_key63 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key63 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key63;
       public            postgres    false    217            
           2606    50863    users users_email_key64 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key64 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key64;
       public            postgres    false    217                       2606    50803    users users_email_key65 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key65 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key65;
       public            postgres    false    217                       2606    50847    users users_email_key66 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key66 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key66;
       public            postgres    false    217                       2606    50805    users users_email_key67 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key67 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key67;
       public            postgres    false    217                       2606    50845    users users_email_key68 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key68 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key68;
       public            postgres    false    217                       2606    50839    users users_email_key69 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key69 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key69;
       public            postgres    false    217                       2606    50981    users users_email_key7 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key7 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key7;
       public            postgres    false    217                       2606    50843    users users_email_key70 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key70 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key70;
       public            postgres    false    217                       2606    50841    users users_email_key71 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key71 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key71;
       public            postgres    false    217                       2606    50987    users users_email_key72 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key72 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key72;
       public            postgres    false    217                       2606    50985    users users_email_key73 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key73 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key73;
       public            postgres    false    217                        2606    50939    users users_email_key74 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key74 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key74;
       public            postgres    false    217            "           2606    50941    users users_email_key75 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key75 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key75;
       public            postgres    false    217            $           2606    50975    users users_email_key76 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key76 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key76;
       public            postgres    false    217            &           2606    50943    users users_email_key77 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key77 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key77;
       public            postgres    false    217            (           2606    50807    users users_email_key78 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key78 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key78;
       public            postgres    false    217            *           2606    50949    users users_email_key79 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key79 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key79;
       public            postgres    false    217            ,           2606    50983    users users_email_key8 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key8 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key8;
       public            postgres    false    217            .           2606    50809    users users_email_key80 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key80 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key80;
       public            postgres    false    217            0           2606    50947    users users_email_key81 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key81 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key81;
       public            postgres    false    217            2           2606    50811    users users_email_key82 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key82 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key82;
       public            postgres    false    217            4           2606    50945    users users_email_key83 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key83 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key83;
       public            postgres    false    217            6           2606    50813    users users_email_key84 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key84 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key84;
       public            postgres    false    217            8           2606    50837    users users_email_key85 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key85 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key85;
       public            postgres    false    217            :           2606    50815    users users_email_key86 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key86 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key86;
       public            postgres    false    217            <           2606    50835    users users_email_key87 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key87 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key87;
       public            postgres    false    217            >           2606    50817    users users_email_key88 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key88 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key88;
       public            postgres    false    217            @           2606    50833    users users_email_key89 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key89 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key89;
       public            postgres    false    217            B           2606    50989    users users_email_key9 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key9 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key9;
       public            postgres    false    217            D           2606    50819    users users_email_key90 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key90 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key90;
       public            postgres    false    217            F           2606    50831    users users_email_key91 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key91 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key91;
       public            postgres    false    217            H           2606    50821    users users_email_key92 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key92 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key92;
       public            postgres    false    217            J           2606    50829    users users_email_key93 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key93 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key93;
       public            postgres    false    217            L           2606    50823    users users_email_key94 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key94 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key94;
       public            postgres    false    217            N           2606    50827    users users_email_key95 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key95 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key95;
       public            postgres    false    217            P           2606    50825    users users_email_key96 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key96 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key96;
       public            postgres    false    217            R           2606    50973    users users_email_key97 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key97 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key97;
       public            postgres    false    217            T           2606    50951    users users_email_key98 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key98 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key98;
       public            postgres    false    217            V           2606    50971    users users_email_key99 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key99 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key99;
       public            postgres    false    217            X           2606    25093    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            Z           2606    51143    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    217            \           2606    51171    users users_username_key1 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key1 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key1;
       public            postgres    false    217            ^           2606    51073    users users_username_key10 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key10 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key10;
       public            postgres    false    217            `           2606    51091    users users_username_key100 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key100 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key100;
       public            postgres    false    217            b           2606    51095    users users_username_key101 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key101 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key101;
       public            postgres    false    217            d           2606    51093    users users_username_key102 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key102 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key102;
       public            postgres    false    217            f           2606    51089    users users_username_key103 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key103 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key103;
       public            postgres    false    217            h           2606    51237    users users_username_key104 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key104 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key104;
       public            postgres    false    217            j           2606    51043    users users_username_key105 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key105 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key105;
       public            postgres    false    217            l           2606    51239    users users_username_key106 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key106 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key106;
       public            postgres    false    217            n           2606    51025    users users_username_key107 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key107 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key107;
       public            postgres    false    217            p           2606    51241    users users_username_key108 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key108 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key108;
       public            postgres    false    217            r           2606    51023    users users_username_key109 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key109 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key109;
       public            postgres    false    217            t           2606    51075    users users_username_key11 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key11 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key11;
       public            postgres    false    217            v           2606    51243    users users_username_key110 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key110 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key110;
       public            postgres    false    217            x           2606    51021    users users_username_key111 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key111 UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key111;
       public            postgres    false    217            z           2606    51077    users users_username_key12 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key12 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key12;
       public            postgres    false    217            |           2606    51141    users users_username_key13 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key13 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key13;
       public            postgres    false    217            ~           2606    51079    users users_username_key14 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key14 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key14;
       public            postgres    false    217            �           2606    51139    users users_username_key15 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key15 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key15;
       public            postgres    false    217            �           2606    51081    users users_username_key16 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key16 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key16;
       public            postgres    false    217            �           2606    51083    users users_username_key17 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key17 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key17;
       public            postgres    false    217            �           2606    51085    users users_username_key18 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key18 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key18;
       public            postgres    false    217            �           2606    51087    users users_username_key19 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key19 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key19;
       public            postgres    false    217            �           2606    51173    users users_username_key2 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key2 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key2;
       public            postgres    false    217            �           2606    51131    users users_username_key20 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key20 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key20;
       public            postgres    false    217            �           2606    51099    users users_username_key21 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key21 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key21;
       public            postgres    false    217            �           2606    51101    users users_username_key22 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key22 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key22;
       public            postgres    false    217            �           2606    51129    users users_username_key23 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key23 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key23;
       public            postgres    false    217            �           2606    51105    users users_username_key24 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key24 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key24;
       public            postgres    false    217            �           2606    51127    users users_username_key25 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key25 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key25;
       public            postgres    false    217            �           2606    51107    users users_username_key26 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key26 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key26;
       public            postgres    false    217            �           2606    51109    users users_username_key27 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key27 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key27;
       public            postgres    false    217            �           2606    51125    users users_username_key28 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key28 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key28;
       public            postgres    false    217            �           2606    51123    users users_username_key29 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key29 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key29;
       public            postgres    false    217            �           2606    51175    users users_username_key3 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key3 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key3;
       public            postgres    false    217            �           2606    51111    users users_username_key30 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key30 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key30;
       public            postgres    false    217            �           2606    51113    users users_username_key31 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key31 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key31;
       public            postgres    false    217            �           2606    51115    users users_username_key32 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key32 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key32;
       public            postgres    false    217            �           2606    51121    users users_username_key33 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key33 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key33;
       public            postgres    false    217            �           2606    51117    users users_username_key34 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key34 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key34;
       public            postgres    false    217            �           2606    51119    users users_username_key35 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key35 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key35;
       public            postgres    false    217            �           2606    51097    users users_username_key36 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key36 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key36;
       public            postgres    false    217            �           2606    51209    users users_username_key37 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key37 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key37;
       public            postgres    false    217            �           2606    51213    users users_username_key38 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key38 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key38;
       public            postgres    false    217            �           2606    51235    users users_username_key39 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key39 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key39;
       public            postgres    false    217            �           2606    51177    users users_username_key4 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key4 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key4;
       public            postgres    false    217            �           2606    51215    users users_username_key40 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key40 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key40;
       public            postgres    false    217            �           2606    51233    users users_username_key41 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key41 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key41;
       public            postgres    false    217            �           2606    51211    users users_username_key42 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key42 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key42;
       public            postgres    false    217            �           2606    51217    users users_username_key43 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key43 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key43;
       public            postgres    false    217            �           2606    51231    users users_username_key44 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key44 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key44;
       public            postgres    false    217            �           2606    51137    users users_username_key45 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key45 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key45;
       public            postgres    false    217            �           2606    51133    users users_username_key46 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key46 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key46;
       public            postgres    false    217            �           2606    51135    users users_username_key47 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key47 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key47;
       public            postgres    false    217            �           2606    51063    users users_username_key48 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key48 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key48;
       public            postgres    false    217            �           2606    51181    users users_username_key49 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key49 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key49;
       public            postgres    false    217            �           2606    51179    users users_username_key5 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key5 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key5;
       public            postgres    false    217            �           2606    51183    users users_username_key50 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key50 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key50;
       public            postgres    false    217            �           2606    51061    users users_username_key51 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key51 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key51;
       public            postgres    false    217            �           2606    51185    users users_username_key52 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key52 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key52;
       public            postgres    false    217            �           2606    51059    users users_username_key53 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key53 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key53;
       public            postgres    false    217            �           2606    51053    users users_username_key54 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key54 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key54;
       public            postgres    false    217            �           2606    51187    users users_username_key55 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key55 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key55;
       public            postgres    false    217            �           2606    51051    users users_username_key56 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key56 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key56;
       public            postgres    false    217            �           2606    51049    users users_username_key57 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key57 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key57;
       public            postgres    false    217            �           2606    51189    users users_username_key58 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key58 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key58;
       public            postgres    false    217            �           2606    51191    users users_username_key59 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key59 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key59;
       public            postgres    false    217            �           2606    51065    users users_username_key6 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key6 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key6;
       public            postgres    false    217            �           2606    51193    users users_username_key60 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key60 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key60;
       public            postgres    false    217            �           2606    51047    users users_username_key61 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key61 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key61;
       public            postgres    false    217            �           2606    51195    users users_username_key62 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key62 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key62;
       public            postgres    false    217            �           2606    51045    users users_username_key63 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key63 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key63;
       public            postgres    false    217            �           2606    51197    users users_username_key64 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key64 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key64;
       public            postgres    false    217            �           2606    51199    users users_username_key65 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key65 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key65;
       public            postgres    false    217            �           2606    51041    users users_username_key66 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key66 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key66;
       public            postgres    false    217            �           2606    51201    users users_username_key67 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key67 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key67;
       public            postgres    false    217            �           2606    51039    users users_username_key68 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key68 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key68;
       public            postgres    false    217            �           2606    51203    users users_username_key69 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key69 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key69;
       public            postgres    false    217            �           2606    51067    users users_username_key7 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key7 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key7;
       public            postgres    false    217            �           2606    51155    users users_username_key70 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key70 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key70;
       public            postgres    false    217            �           2606    51205    users users_username_key71 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key71 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key71;
       public            postgres    false    217            �           2606    51153    users users_username_key72 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key72 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key72;
       public            postgres    false    217                        2606    51151    users users_username_key73 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key73 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key73;
       public            postgres    false    217                       2606    51207    users users_username_key74 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key74 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key74;
       public            postgres    false    217                       2606    51027    users users_username_key75 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key75 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key75;
       public            postgres    false    217                       2606    51149    users users_username_key76 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key76 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key76;
       public            postgres    false    217                       2606    51029    users users_username_key77 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key77 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key77;
       public            postgres    false    217            
           2606    51031    users users_username_key78 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key78 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key78;
       public            postgres    false    217                       2606    51147    users users_username_key79 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key79 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key79;
       public            postgres    false    217                       2606    51069    users users_username_key8 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key8 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key8;
       public            postgres    false    217                       2606    51033    users users_username_key80 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key80 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key80;
       public            postgres    false    217                       2606    51145    users users_username_key81 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key81 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key81;
       public            postgres    false    217                       2606    51035    users users_username_key82 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key82 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key82;
       public            postgres    false    217                       2606    51229    users users_username_key83 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key83 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key83;
       public            postgres    false    217                       2606    51219    users users_username_key84 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key84 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key84;
       public            postgres    false    217                       2606    51227    users users_username_key85 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key85 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key85;
       public            postgres    false    217                       2606    51221    users users_username_key86 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key86 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key86;
       public            postgres    false    217                       2606    51225    users users_username_key87 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key87 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key87;
       public            postgres    false    217                        2606    51223    users users_username_key88 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key88 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key88;
       public            postgres    false    217            "           2606    51057    users users_username_key89 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key89 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key89;
       public            postgres    false    217            $           2606    51071    users users_username_key9 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key9 UNIQUE (username);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key9;
       public            postgres    false    217            &           2606    51055    users users_username_key90 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key90 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key90;
       public            postgres    false    217            (           2606    51037    users users_username_key91 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key91 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key91;
       public            postgres    false    217            *           2606    51157    users users_username_key92 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key92 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key92;
       public            postgres    false    217            ,           2606    51169    users users_username_key93 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key93 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key93;
       public            postgres    false    217            .           2606    51159    users users_username_key94 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key94 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key94;
       public            postgres    false    217            0           2606    51167    users users_username_key95 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key95 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key95;
       public            postgres    false    217            2           2606    51161    users users_username_key96 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key96 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key96;
       public            postgres    false    217            4           2606    51165    users users_username_key97 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key97 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key97;
       public            postgres    false    217            6           2606    51163    users users_username_key98 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key98 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key98;
       public            postgres    false    217            8           2606    51103    users users_username_key99 
   CONSTRAINT     Y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key99 UNIQUE (username);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key99;
       public            postgres    false    217            �   J   x�32021440547014�M.JM,I�--N-*��*�2�K�&�����sSu����RtK�b���� �D      �   P   x�3�(�O)M.�WpTpL.)M�ɬJL��,(�/3�42�4� �F&�����
FFVV�fzF���&z��\1z\\\ S�      �   F   x�3�,(�/3�4��4202�54�50U02�25�20�3�4D��26ճ42�L��LI+N+�42����� g��      �      x������ � �      �   X   x�3�(�O)M.�Wp�4422�3�4202�54�50S00�22�24�36��)�A\FDf�glf�Sn�1Q���[������ ��1�      �   M  x����n�@���)���uwa��J��(�VDӛ�,�+�Zߨ���j���4�d2�9�b�,�k�5>���T�ʯ�/��K��G�	�yzq������k"ش�p�˴d��J�r���O�}�o�t��t8�̽b���$�I;����%��B�Ia� R@5E�?,�PDS��.nY�,���e>��&��,J.xB��7��s����Du����I��v@�p7���FՀD=���#%*��?�F ��7ڵ%k��3���HqA4�U��aS6w�]:���4Q�Bˑwܾ�}�)�v�/g�".o�T�[`��r���MS��O@��O)���     