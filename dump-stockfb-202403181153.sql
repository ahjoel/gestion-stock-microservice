PGDMP     7    5                |            stockfb    15.4    15.4 F    X           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            [           1262    16767    stockfb    DATABASE     z   CREATE DATABASE stockfb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';
    DROP DATABASE stockfb;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            \           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16928    _user    TABLE     p  CREATE TABLE public._user (
    id integer NOT NULL,
    email character varying(255),
    first_name character varying(255),
    password character varying(255),
    pseudo character varying(255),
    role character varying(255),
    CONSTRAINT _user_role_check CHECK (((role)::text = ANY ((ARRAY['USER'::character varying, 'ADMIN'::character varying])::text[])))
);
    DROP TABLE public._user;
       public         heap    postgres    false    4            �            1259    16927    _user_id_seq    SEQUENCE     �   CREATE SEQUENCE public._user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public._user_id_seq;
       public          postgres    false    4    233            ]           0    0    _user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public._user_id_seq OWNED BY public._user.id;
          public          postgres    false    232            �            1259    16768 	   categorie    TABLE     �   CREATE TABLE public.categorie (
    id bigint NOT NULL,
    code character varying(255),
    description character varying(255),
    nom character varying(255)
);
    DROP TABLE public.categorie;
       public         heap    postgres    false    4            �            1259    16825    categorie_seq    SEQUENCE     w   CREATE SEQUENCE public.categorie_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.categorie_seq;
       public          postgres    false    4            �            1259    16775    commande    TABLE     �   CREATE TABLE public.commande (
    id bigint NOT NULL,
    code character varying(255),
    date_commande date,
    employe_id bigint NOT NULL
);
    DROP TABLE public.commande;
       public         heap    postgres    false    4            �            1259    16826    commande_seq    SEQUENCE     v   CREATE SEQUENCE public.commande_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.commande_seq;
       public          postgres    false    4            �            1259    16780    employe    TABLE     �   CREATE TABLE public.employe (
    id bigint NOT NULL,
    code character varying(255),
    etat character varying(255),
    nom character varying(255),
    prenom character varying(255),
    service character varying(255)
);
    DROP TABLE public.employe;
       public         heap    postgres    false    4            �            1259    16827    employe_seq    SEQUENCE     u   CREATE SEQUENCE public.employe_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.employe_seq;
       public          postgres    false    4            �            1259    16787 
   fourniture    TABLE     9  CREATE TABLE public.fourniture (
    id bigint NOT NULL,
    code character varying(255),
    date_creation date,
    date_modification date,
    etat character varying(255),
    mesure character varying(255),
    nom character varying(255),
    qte_min character varying(255),
    category_id bigint NOT NULL
);
    DROP TABLE public.fourniture;
       public         heap    postgres    false    4            �            1259    16828    fourniture_seq    SEQUENCE     x   CREATE SEQUENCE public.fourniture_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.fourniture_seq;
       public          postgres    false    4            �            1259    16794    ligne_commande    TABLE     �   CREATE TABLE public.ligne_commande (
    id bigint NOT NULL,
    etat character varying(255),
    qte double precision,
    commande_id bigint NOT NULL,
    fourniture_id bigint NOT NULL
);
 "   DROP TABLE public.ligne_commande;
       public         heap    postgres    false    4            �            1259    16829    ligne_commande_seq    SEQUENCE     |   CREATE SEQUENCE public.ligne_commande_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.ligne_commande_seq;
       public          postgres    false    4            �            1259    16799    ligne_livraison    TABLE       CREATE TABLE public.ligne_livraison (
    id bigint NOT NULL,
    etat character varying(255),
    prix double precision,
    qte double precision,
    fourniture_id bigint NOT NULL,
    lignecommande_id bigint NOT NULL,
    livraison_id bigint NOT NULL
);
 #   DROP TABLE public.ligne_livraison;
       public         heap    postgres    false    4            �            1259    16830    ligne_livraison_seq    SEQUENCE     }   CREATE SEQUENCE public.ligne_livraison_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.ligne_livraison_seq;
       public          postgres    false    4            �            1259    16804 	   livraison    TABLE     �   CREATE TABLE public.livraison (
    id bigint NOT NULL,
    code character varying(255),
    date_livraison date,
    fournisseur character varying(255),
    tva double precision
);
    DROP TABLE public.livraison;
       public         heap    postgres    false    4            �            1259    16831    livraison_seq    SEQUENCE     w   CREATE SEQUENCE public.livraison_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.livraison_seq;
       public          postgres    false    4            �            1259    16811 	   mouvement    TABLE     C  CREATE TABLE public.mouvement (
    id bigint NOT NULL,
    code character varying(255),
    date_inventaire date,
    date_mouvement date,
    etat character varying(255),
    nature character varying(255),
    qte double precision,
    fourniture_id bigint NOT NULL,
    lignelivraison_id bigint,
    sortie_id bigint
);
    DROP TABLE public.mouvement;
       public         heap    postgres    false    4            �            1259    16832    mouvement_seq    SEQUENCE     w   CREATE SEQUENCE public.mouvement_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.mouvement_seq;
       public          postgres    false    4            �            1259    16818    sortie    TABLE     �   CREATE TABLE public.sortie (
    id bigint NOT NULL,
    code character varying(255),
    date_sortie date,
    etat character varying(255),
    qte double precision,
    employe_id bigint NOT NULL,
    fourniture_id bigint NOT NULL
);
    DROP TABLE public.sortie;
       public         heap    postgres    false    4            �            1259    16833 
   sortie_seq    SEQUENCE     t   CREATE SEQUENCE public.sortie_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.sortie_seq;
       public          postgres    false    4            �           2604    16931    _user id    DEFAULT     d   ALTER TABLE ONLY public._user ALTER COLUMN id SET DEFAULT nextval('public._user_id_seq'::regclass);
 7   ALTER TABLE public._user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            U          0    16928    _user 
   TABLE DATA           N   COPY public._user (id, email, first_name, password, pseudo, role) FROM stdin;
    public          postgres    false    233   eS       B          0    16768 	   categorie 
   TABLE DATA           ?   COPY public.categorie (id, code, description, nom) FROM stdin;
    public          postgres    false    214   �T       C          0    16775    commande 
   TABLE DATA           G   COPY public.commande (id, code, date_commande, employe_id) FROM stdin;
    public          postgres    false    215   �T       D          0    16780    employe 
   TABLE DATA           G   COPY public.employe (id, code, etat, nom, prenom, service) FROM stdin;
    public          postgres    false    216   �T       E          0    16787 
   fourniture 
   TABLE DATA           y   COPY public.fourniture (id, code, date_creation, date_modification, etat, mesure, nom, qte_min, category_id) FROM stdin;
    public          postgres    false    217   3U       F          0    16794    ligne_commande 
   TABLE DATA           S   COPY public.ligne_commande (id, etat, qte, commande_id, fourniture_id) FROM stdin;
    public          postgres    false    218   rU       G          0    16799    ligne_livraison 
   TABLE DATA           m   COPY public.ligne_livraison (id, etat, prix, qte, fourniture_id, lignecommande_id, livraison_id) FROM stdin;
    public          postgres    false    219   �U       H          0    16804 	   livraison 
   TABLE DATA           O   COPY public.livraison (id, code, date_livraison, fournisseur, tva) FROM stdin;
    public          postgres    false    220   �U       I          0    16811 	   mouvement 
   TABLE DATA           �   COPY public.mouvement (id, code, date_inventaire, date_mouvement, etat, nature, qte, fourniture_id, lignelivraison_id, sortie_id) FROM stdin;
    public          postgres    false    221   �U       J          0    16818    sortie 
   TABLE DATA           ]   COPY public.sortie (id, code, date_sortie, etat, qte, employe_id, fourniture_id) FROM stdin;
    public          postgres    false    222   �U       ^           0    0    _user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public._user_id_seq', 6, true);
          public          postgres    false    232            _           0    0    categorie_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.categorie_seq', 1, false);
          public          postgres    false    223            `           0    0    commande_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.commande_seq', 1, false);
          public          postgres    false    224            a           0    0    employe_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.employe_seq', 51, true);
          public          postgres    false    225            b           0    0    fourniture_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.fourniture_seq', 1, true);
          public          postgres    false    226            c           0    0    ligne_commande_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.ligne_commande_seq', 1, false);
          public          postgres    false    227            d           0    0    ligne_livraison_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.ligne_livraison_seq', 1, false);
          public          postgres    false    228            e           0    0    livraison_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.livraison_seq', 1, false);
          public          postgres    false    229            f           0    0    mouvement_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.mouvement_seq', 1, false);
          public          postgres    false    230            g           0    0 
   sortie_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.sortie_seq', 1, false);
          public          postgres    false    231            �           2606    16936    _user _user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public._user
    ADD CONSTRAINT _user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public._user DROP CONSTRAINT _user_pkey;
       public            postgres    false    233            �           2606    16774    categorie categorie_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categorie DROP CONSTRAINT categorie_pkey;
       public            postgres    false    214            �           2606    16779    commande commande_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.commande DROP CONSTRAINT commande_pkey;
       public            postgres    false    215            �           2606    16786    employe employe_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.employe
    ADD CONSTRAINT employe_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.employe DROP CONSTRAINT employe_pkey;
       public            postgres    false    216            �           2606    16793    fourniture fourniture_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.fourniture
    ADD CONSTRAINT fourniture_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.fourniture DROP CONSTRAINT fourniture_pkey;
       public            postgres    false    217            �           2606    16798 "   ligne_commande ligne_commande_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ligne_commande
    ADD CONSTRAINT ligne_commande_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.ligne_commande DROP CONSTRAINT ligne_commande_pkey;
       public            postgres    false    218            �           2606    16803 $   ligne_livraison ligne_livraison_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.ligne_livraison
    ADD CONSTRAINT ligne_livraison_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.ligne_livraison DROP CONSTRAINT ligne_livraison_pkey;
       public            postgres    false    219            �           2606    16810    livraison livraison_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.livraison DROP CONSTRAINT livraison_pkey;
       public            postgres    false    220            �           2606    16817    mouvement mouvement_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.mouvement
    ADD CONSTRAINT mouvement_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.mouvement DROP CONSTRAINT mouvement_pkey;
       public            postgres    false    221            �           2606    16824    sortie sortie_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.sortie
    ADD CONSTRAINT sortie_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.sortie DROP CONSTRAINT sortie_pkey;
       public            postgres    false    222            �           2606    16864 +   ligne_livraison fk1j1gxkldde0s767kip7vu8848    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_livraison
    ADD CONSTRAINT fk1j1gxkldde0s767kip7vu8848 FOREIGN KEY (livraison_id) REFERENCES public.livraison(id);
 U   ALTER TABLE ONLY public.ligne_livraison DROP CONSTRAINT fk1j1gxkldde0s767kip7vu8848;
       public          postgres    false    3233    219    220            �           2606    16879 %   mouvement fk26xtbh6a0ir83sbcv7gdc3jvb    FK CONSTRAINT     �   ALTER TABLE ONLY public.mouvement
    ADD CONSTRAINT fk26xtbh6a0ir83sbcv7gdc3jvb FOREIGN KEY (sortie_id) REFERENCES public.sortie(id);
 O   ALTER TABLE ONLY public.mouvement DROP CONSTRAINT fk26xtbh6a0ir83sbcv7gdc3jvb;
       public          postgres    false    3237    222    221            �           2606    16859 +   ligne_livraison fk8vydljb9a2ih3vn9kdrbs9evu    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_livraison
    ADD CONSTRAINT fk8vydljb9a2ih3vn9kdrbs9evu FOREIGN KEY (lignecommande_id) REFERENCES public.ligne_commande(id);
 U   ALTER TABLE ONLY public.ligne_livraison DROP CONSTRAINT fk8vydljb9a2ih3vn9kdrbs9evu;
       public          postgres    false    219    218    3229            �           2606    16844 *   ligne_commande fkaff2bjyreiuyi723relg10spm    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_commande
    ADD CONSTRAINT fkaff2bjyreiuyi723relg10spm FOREIGN KEY (commande_id) REFERENCES public.commande(id);
 T   ALTER TABLE ONLY public.ligne_commande DROP CONSTRAINT fkaff2bjyreiuyi723relg10spm;
       public          postgres    false    218    215    3223            �           2606    16839 &   fourniture fkbaf3j9atsrc7w4jbby1e2uj6q    FK CONSTRAINT     �   ALTER TABLE ONLY public.fourniture
    ADD CONSTRAINT fkbaf3j9atsrc7w4jbby1e2uj6q FOREIGN KEY (category_id) REFERENCES public.categorie(id);
 P   ALTER TABLE ONLY public.fourniture DROP CONSTRAINT fkbaf3j9atsrc7w4jbby1e2uj6q;
       public          postgres    false    217    214    3221            �           2606    16854 +   ligne_livraison fkd44wi8kfej9oiti494vr2ux30    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_livraison
    ADD CONSTRAINT fkd44wi8kfej9oiti494vr2ux30 FOREIGN KEY (fourniture_id) REFERENCES public.fourniture(id);
 U   ALTER TABLE ONLY public.ligne_livraison DROP CONSTRAINT fkd44wi8kfej9oiti494vr2ux30;
       public          postgres    false    3227    219    217            �           2606    16869 %   mouvement fkfd2e15mrj748lwe6n1k7etxu3    FK CONSTRAINT     �   ALTER TABLE ONLY public.mouvement
    ADD CONSTRAINT fkfd2e15mrj748lwe6n1k7etxu3 FOREIGN KEY (fourniture_id) REFERENCES public.fourniture(id);
 O   ALTER TABLE ONLY public.mouvement DROP CONSTRAINT fkfd2e15mrj748lwe6n1k7etxu3;
       public          postgres    false    217    221    3227            �           2606    16834 $   commande fkgmjxre8plwya7d03jragug1yc    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT fkgmjxre8plwya7d03jragug1yc FOREIGN KEY (employe_id) REFERENCES public.employe(id);
 N   ALTER TABLE ONLY public.commande DROP CONSTRAINT fkgmjxre8plwya7d03jragug1yc;
       public          postgres    false    3225    215    216            �           2606    16849 *   ligne_commande fkli5gehdqsab9vvn4gjqab8r7a    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_commande
    ADD CONSTRAINT fkli5gehdqsab9vvn4gjqab8r7a FOREIGN KEY (fourniture_id) REFERENCES public.fourniture(id);
 T   ALTER TABLE ONLY public.ligne_commande DROP CONSTRAINT fkli5gehdqsab9vvn4gjqab8r7a;
       public          postgres    false    3227    217    218            �           2606    16884 "   sortie fko14rdhow25xs1cjnh82wymfbf    FK CONSTRAINT     �   ALTER TABLE ONLY public.sortie
    ADD CONSTRAINT fko14rdhow25xs1cjnh82wymfbf FOREIGN KEY (employe_id) REFERENCES public.employe(id);
 L   ALTER TABLE ONLY public.sortie DROP CONSTRAINT fko14rdhow25xs1cjnh82wymfbf;
       public          postgres    false    222    3225    216            �           2606    16874 %   mouvement fkqnqdjsrho4wgqk8iua9gyg6w2    FK CONSTRAINT     �   ALTER TABLE ONLY public.mouvement
    ADD CONSTRAINT fkqnqdjsrho4wgqk8iua9gyg6w2 FOREIGN KEY (lignelivraison_id) REFERENCES public.ligne_livraison(id);
 O   ALTER TABLE ONLY public.mouvement DROP CONSTRAINT fkqnqdjsrho4wgqk8iua9gyg6w2;
       public          postgres    false    219    221    3231            �           2606    16889 "   sortie fktqaeorl2lara088ny4ikrh6l0    FK CONSTRAINT     �   ALTER TABLE ONLY public.sortie
    ADD CONSTRAINT fktqaeorl2lara088ny4ikrh6l0 FOREIGN KEY (fourniture_id) REFERENCES public.fourniture(id);
 L   ALTER TABLE ONLY public.sortie DROP CONSTRAINT fktqaeorl2lara088ny4ikrh6l0;
       public          postgres    false    222    217    3227            U     x�u��r�0 �5|�k���
q 7Q%r	�T��w,ө���9�D�"4?�r�(@���I�>��Zoƈ%|��BQ6��v��ÉǇ�|�F�t��*���&ăFz�i8�l�$������5�r�N����oU��㈟U���Xmo<p2�]���KI!+^���k'���.�ٷk�o�2�)�����o���h�B<|���X�U�y>|b^��ӌ���L�[��P�Qa���IZ\Wj�yY�{�G��Ϋ;p�Ȳ��^xU      B      x�3�t
ru�u������� �w
�      C      x������ � �      D   O   x�M�1�  ����F��X�A,)e���0l��	��$��]0_���5ӭ�Ƃ�{a�2�p�Qks��]p��l�      E   /   x�3����!G��0W�P?�W� G_� mb�i����� ށ	d      F      x������ � �      G      x������ � �      H      x������ � �      I      x������ � �      J      x������ � �     